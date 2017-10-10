package com.th.service.Impl;

import com.th.bean.Module;
import com.th.dao.ModuleDAO;
import com.th.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ModuleDAO moduleDAO;

    public List<Module> list() {
        return moduleDAO.list();
    }
}
