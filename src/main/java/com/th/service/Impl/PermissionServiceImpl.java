package com.th.service.Impl;

import com.th.dao.PermissionDAO;
import com.th.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDAO permissionDAO;

    public List<String> listPermissions(String username) {
        return permissionDAO.listPermissions(username);
    }
}
