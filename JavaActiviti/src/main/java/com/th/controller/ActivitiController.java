package com.th.controller;

import com.th.bean.BossTask;
import com.th.bean.LeaveApply;
import com.th.bean.User;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.impl.DefaultProcessDiagramGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

@Controller
@RequestMapping("/activiti")
public class ActivitiController {

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @GetMapping(value = "deploy/{processName}", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deploy(@PathVariable("processName") String processName) {
        // 部署流程
        repositoryService.createDeployment().addClasspathResource("diagrams/" + processName + ".bpmn20.xml").deploy();
        return "部署成功!";
    }

    /**
     * 跳转到请假表单
     * @return
     */
    @RequestMapping("to_leave")
    public String toLeave() {
        return "leave_apply";
    }

    @RequestMapping(value = "leave", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String leave(LeaveApply leaveApply) {
        User user = new User();// 从Session里获取当前登录的用户
        user.setName("emp1");
        // 1、启动流程
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("emp_name", user.getName());
        data.put("days", leaveApply.getDays());
        data.put("reason", leaveApply.getReason());
        data.put("datetime", Calendar.getInstance().getTime());
        runtimeService.startProcessInstanceByKey("leave_process_complex", data);
        // 2、员工完成请假申请任务

        List<Task> taskList = listUserTasks(user);
        for (Task task : taskList) {
            taskService.complete(task.getId(), data);
        }
        return "已提交请假";
    }

    private List<Task> listUserTasks(User user) {
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(user.getName()).list(); // 只会列出当前登录用户的所有待办任务
        Iterator<Task> taskIterator = taskList.iterator();
        while (taskIterator.hasNext()) {
            Task task = taskIterator.next(); // 获取任务
            String executor = String.valueOf(taskService.getVariable(task.getId(), "emp_name")); // 可以获取谁在跑这个流程
            if (executor != null && !executor.equals(user.getName())) {
                taskIterator.remove();
            }
        }
        return taskList; // 只返回某个用户自己启动的流程中的所有任务
    }

    @GetMapping("boss_tasks")
    public ModelAndView listBossTasks() {
        // 查询老板的所有任务
        User user = new User();
        user.setName("boss1");
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(user.getName()).list();
        // 任务id，任务名称，请假人，请假时间，请假天数，请假理由
        List<BossTask> bossTaskList = new ArrayList<BossTask>();
        for (Task task : taskList) {
            BossTask bossTask = new BossTask();
            bossTask.setTaskId(task.getId());
            bossTask.setTaskName(task.getName());
            bossTask.setEmpName((String) taskService.getVariable(task.getId(), "emp_name"));
            bossTask.setDays(Integer.valueOf(taskService.getVariable(task.getId(), "days").toString()));
            bossTask.setReason((String) taskService.getVariable(task.getId(), "reason"));
            bossTask.setDatetime(((Date)taskService.getVariable(task.getId(), "datetime")).toString());
            bossTaskList.add(bossTask);
        }
        ModelAndView mav = new ModelAndView("boss");
        mav.addObject("bossTaskList", bossTaskList);
        return mav;
    }

    @RequestMapping(value = "check/{taskId}", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String check(@PathVariable("taskId") String taskId) {
        taskService.complete(taskId);
        return "checked!";
    }

    /**
     * 获取的是我们截取的png图片
     * @param resp
     * @throws IOException
     */
    @RequestMapping("view_proc")
    public void viewProc(HttpServletResponse resp) throws IOException {
        List<Deployment> deployments = repositoryService.createDeploymentQuery().deploymentKey("leave_process_complex").list();
        for (Deployment deployment : deployments) {
            deployment.getId();
        }
        List<Model> models = repositoryService.createModelQuery().deploymentId("32521").list();
        for (Model model : models) {
            model.getId();
        }
        List<String> names = repositoryService.getDeploymentResourceNames("32521");
        String imageName = null;
        for (String name : names) {
            if(name.indexOf(".png") >= 0){
                imageName = name;
            }
        }
        System.out.println("=====================================" + imageName);
        InputStream in = repositoryService.getResourceAsStream("32521", imageName);
        /**
         ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
         .processDefinitionKey("expense")
         .singleResult();
         String diagramResourceName = processDefinition.getDiagramResourceName();
         InputStream imageStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), diagramResourceName);
         */
        OutputStream out = resp.getOutputStream();
        byte[] b = new byte[1024];
        for (int len = -1; (len= in.read(b))!= -1; ) {
            out.write(b, 0, len);
        }
        out.close();
        in.close();
    }

    /**
     * 是由Acitivi生成的png图片，需要解决中文乱码的问题
     * @param resp
     * @throws IOException
     */
    @RequestMapping("view_proc1")
    public void viewProc1(HttpServletResponse resp) throws IOException {
        List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery() // 获取查询流程实例的对象
                .processDefinitionKey("leave_process_complex").list();
        List<Execution> executions = runtimeService.createExecutionQuery() // 根据流程实例对象查找当前需要执行的任务的节点
                .processInstanceId(processInstances.get(0).getId()).list();
        //得到正在执行的Activity的Id
        List<String> activityIds = new ArrayList<String>();
        for (Execution execution : executions) {
            List<String> ids = runtimeService.getActiveActivityIds(execution.getId()); // 获取正在执行的任务节点对应的task
            activityIds.addAll(ids);
        }
        // DefaultProcessDiagramGenerator 是Activiti提供的用于产生标识出当前任务节点的流程图片
        InputStream in = new DefaultProcessDiagramGenerator().generateDiagram(
                repositoryService.getBpmnModel("leave_process_complex:1:32521"), "png", activityIds);
        OutputStream out = resp.getOutputStream();
        byte[] b = new byte[1024];
        for (int len = -1; (len= in.read(b)) != -1;) {
            out.write(b, 0, len);
        }
        out.close();
        in.close();
    }

}
