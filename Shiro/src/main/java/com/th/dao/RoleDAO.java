package com.th.dao;

import com.th.bean.Role;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoleDAO {

    List<Role> list();

    List<String> listRoles(String username);
}
