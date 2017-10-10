package com.th.dao;

import com.th.bean.Module;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ModuleDAO {

    List<Module> list();

}
