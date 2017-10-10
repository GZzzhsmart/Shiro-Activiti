package com.th.service;

import com.th.bean.Permission;

import java.util.List;

public interface PermissionService {

    List<String> listPermissions(String username);

    List<Permission> listByModule(Integer moduleId);

}
