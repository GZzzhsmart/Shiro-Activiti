package com.th.service;

import com.th.bean.User;
import org.apache.ibatis.annotations.Param;


public interface UserService {

    User getByNamePwd(String name, String pwd);
}
