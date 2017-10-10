package com.th.dao;

import com.th.bean.Permission;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PermissionDAO {

    List<String> listPermissions(String username);

    List<Permission> listByModule(Integer moduleId);

}
