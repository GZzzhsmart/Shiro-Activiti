package com.th.service;

import com.th.bean.Role;

import java.util.List;

public interface RoleService {

    List<String> listRoles(String username);

    List<Role> list();

}
