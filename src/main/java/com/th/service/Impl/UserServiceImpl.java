package com.th.service.Impl;

import com.th.bean.User;
import com.th.dao.UserDAO;
import com.th.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    public User getByNamePwd(String name, String pwd) {
        return userDAO.getByNamePwd(name, pwd);
    }
}
