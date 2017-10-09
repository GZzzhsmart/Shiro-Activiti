package com.th.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionDAO {

    List<String> listPermissions(String username);

}
