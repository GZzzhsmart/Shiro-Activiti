package com.th.dao;

import com.th.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface UserDAO {

    User getByNamePwd(@Param("name") String name, @Param("pwd") String pwd);

}
