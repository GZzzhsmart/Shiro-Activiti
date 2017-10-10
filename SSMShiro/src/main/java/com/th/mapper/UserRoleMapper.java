package com.th.mapper;

import java.util.List;

import com.th.model.UserRole;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleMapper {

    int insert(UserRole userRole);

    int updateByPrimaryKeySelective(UserRole userRole);

    List<UserRole> findUserRoleByUserId(Long userId);

    int deleteById(Long id);

    List<Long> findRoleIdListByUserId(Long userId);
}