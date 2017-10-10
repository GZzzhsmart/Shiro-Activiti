package com.th.service.Impl;

import com.th.bean.Role;
import com.th.dao.RoleDAO;
import com.th.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    public List<String> listRoles(String username) {
        return roleDAO.listRoles(username);
    }

    public List<Role> list() {
        return roleDAO.list();
    }
}
