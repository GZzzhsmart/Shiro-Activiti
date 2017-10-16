package com.th.controller;

import com.th.bean.BossTask;
import com.th.bean.LeaveApply;
import com.th.bean.User;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    @GetMapping(value = "deploy/{processName}",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deploy(@PathVariable("processName") String processName){
        repositoryService.createDeployment().addClasspathResource("diagrams/"+processName+".bpmn20.xml").deploy();
        return "部署成功";
    }

    /**
     * 跳转到请假表单
     * @return
     */
    @GetMapping("to_leave")
    public String toLeave(){
        return "leave_apply";
    }

    @RequestMapping(value = "leave",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String leave(LeaveApply leaveApply){
        //通过session获取当前登录用户
        User user = new User();
        user.setName("emp1");
        //启动流程
        Map<String,Object> data = new HashMap <String,Object>();
        data.put("emp_name",user.getName());
        data.put("days",leaveApply.getDays());
        data.put("reason",leaveApply.getReason());
        data.put("datetime", Calendar.getInstance().getTime());
        runtimeService.startProcessInstanceByKey("leave_process_complex",data);
        //员工完成请假申请任务
        List<Task> taskList = listUserTasks(user);
        for (Task task:taskList) {
            taskService.complete(task.getId(),data);
        }
        return "已提交请假";
    }

    private List<Task> listUserTasks(User user){
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

    @GetMapping("boss_checks")
    public ModelAndView listBossTasks(){
        //查询老板的所有任务
        User user = new User();
        user.setName("boss1");
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(user.getName()).list();
        List<BossTask> bossTaskList = new ArrayList <BossTask>();
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
        mav.addObject("bossTaskList",bossTaskList);
        return mav;
    }

    /**
     * 同意请假申请
     * @param taskId
     * @return
     */
    @RequestMapping("check/{taskId}")
    @ResponseBody
    public String check(@PathVariable("taskId") String taskId){
        taskService.complete(taskId);
        return "check!";
    }
}
