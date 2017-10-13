package com.th.dao;

import java.util.List;
import java.util.Map;

import com.th.model.Leave;
import org.springframework.stereotype.Repository;


/**
 * 业务管理
 * @author Administrator
 *
 */
@Repository
public interface LeaveDao {
	public List<Leave> leavePage(Map<String,Object> map);

	public int leaveCount(Map<String,Object> map);

	public int addLeave(Leave leave);

	public Leave findById(String id);

	public int updateLeave(Leave leave);

	public Leave getLeaveByTaskId(String processInstanceId);
}
