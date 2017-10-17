package com.th.activiti;

import com.th.bean.LeaveApply;
import com.th.bean.User;
import junit.framework.TestCase;
import org.activiti.engine.*;
import org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;

import java.util.*;

public class LeaveProcessGatawayAcitivi extends TestCase {

    private ProcessEngine processEngine;

    @Override
    protected void setUp() throws Exception {
        ProcessEngineConfiguration cfg = new StandaloneProcessEngineConfiguration()
                .setJdbcUrl("jdbc:mysql://localhost:3306/activiti")
                .setJdbcUsername("root")
                .setJdbcPassword("123456")
                .setJdbcDriver("com.mysql.jdbc.Driver")
                .setDatabaseSchemaUpdate(ProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE);
        processEngine = cfg.buildProcessEngine(); // 通过配置器构建流程引擎，activiti自动到配置的数据库中创建28张表
        String pName = processEngine.getName();
        String ver = ProcessEngine.VERSION;
        System.out.println("ProcessEngine [" + pName + "] Version: [" + ver + "]");
    }

    @Test
    public void testDeleteDeploy() {
        RepositoryService repositoryService = processEngine.getRepositoryService();
        repositoryService.deleteDeployment("97501");
    }

    @Test
    public void testDeploy() {
        RepositoryService repositoryService = processEngine.getRepositoryService();
        repositoryService.createDeployment().addClasspathResource("diagrams/leave_process_gateway.bpmn20.xml").deploy(); //  先读取流程定义文件，再完成部署
    }

    @Test
    public void testStartProcess() {
        startProcess(new User("emp1", "emp"));
    }

    @Test
    public void testUserTask() {
        // emp1员工请假
        executeUserTask(new User("emp1", "emp"), new LeaveApply(5, "玩", Calendar.getInstance().getTime()));
    }

    @Test
    public void testBossTask() {
        executeBossTask(new User("boss1", "boss"));
    }

    /**
     * 在启动流程的时候，把当前用户信息也传递到流程中，用于区分哪个任务可以被用户执行
     * @param user
     */
    private void startProcess(User user) {
        if (user.getRole().equals("emp1")) {
            RuntimeService runtimeService = processEngine.getRuntimeService();
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("emp_name", user.getName());
            ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("leave_process_gateway", data);
            System.out.println("请假流程已启动……" + processInstance.getId());
        }
    }

    /**
     * 根据用户信息查找只属于此用户的流程中的所有任务
     *
     * 此方法用到variable变量的概念，在流程流转的过程中传递参数，由一个任务传递参数到另外一个任务
     *
     * @param user
     * @return
     */
    private List<Task> listUserTasks(User user) {
        TaskService taskService = processEngine.getTaskService();
        List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(user.getName()).list(); // 只会列出当前登录用户的所有待办任务
            Iterator<Task> taskIterator = taskList.iterator();
            while (taskIterator.hasNext()) {
            Task task = taskIterator.next(); // 获取任务
            String executor = String.valueOf(taskService.getVariable(task.getId(), "emp_name")); // 可以获取谁在跑这个流程
            if (!executor.equals(user.getName())) {
                taskIterator.remove();
            }
        }
        return taskList; // 只返回某个用户自己启动的流程中的所有任务
    }

    /**
     * 执行只属于此用户的流程中的任务
     * @param user
     */
    private void executeUserTask(User user, LeaveApply leaveApply) {
        TaskService taskService = processEngine.getTaskService();
        List<Task> taskList = listUserTasks(user);
        for (Task task : taskList) {
            System.out.println("task name: " + task.getName());
            // taskService.complete(task.getId());
            Map<String, Object> data = new HashMap<String, Object>();
            data.put("days", leaveApply.getDays());
            data.put("reason", leaveApply.getReason());
            data.put("datetime", leaveApply.getDatetime());
            taskService.complete(task.getId(), data);
        }
    }

    private void executeBossTask(User user) {
        if (user.getRole().equals("boss")) {
            TaskService taskService = processEngine.getTaskService();
            List<Task> taskList = taskService.createTaskQuery().taskCandidateUser(user.getName()).list(); // 只会列出当前登录用户的所有待办任务
            for (Task task : taskList) {
                System.out.println("task name: " + task.getName());
                Map<String, Object> data = taskService.getVariables(task.getId()); // 此任务的参数map
                taskService.complete(task.getId(), data);
            }
        }
    }

}
