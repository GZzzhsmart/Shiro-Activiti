package com.th.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.th.dao.UserDao;
import com.th.model.User;
import com.th.service.UserService;

@Service("serService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;

	public User findById(String userId){
		return userDao.findById(userId);
	}
	/**
	 * 登入
	 * @return
	 */
	public User userLogin(User user){
		return userDao.userLogin(user);
	}

	/**'
	 * 分页查询用户
	 * @param map
	 * @return
	 */
	public List<User> userPage(Map<String, Object> map){
		return userDao.userPage(map);
	}

	public int userCount(Map<String, Object> map){
		return userDao.userCount(map);
	}

	/**
	 * 批量删除用户
	 * @param id
	 * @return
	 */
	public int deleteUser(List<String> id){
		return userDao.deleteUser(id);
	}

	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user){
		return userDao.updateUser(user);
	}

	/**
	 * 新增用户
	 * @param user
	 * @return
	 */
	public int addUser(User user){
		return userDao.addUser(user);
	}
}
