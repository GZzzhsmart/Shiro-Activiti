package com.th.dao;

import java.util.Map;

import com.th.model.MemberShip;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberShipDao {
	/**
	 * 用户登入的方法
	 * @return
	 */
	public MemberShip userLogin(Map <String, Object> map);
	
	public int deleteAllGroupsByUserId(String userId);
	
	public int addMemberShip(MemberShip memberShip);
}
