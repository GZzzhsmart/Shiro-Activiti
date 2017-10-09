package com.th.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDAO {

    List<String> listRoles(String username);
}
