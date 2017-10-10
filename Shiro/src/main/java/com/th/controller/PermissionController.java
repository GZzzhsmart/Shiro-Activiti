package com.th.controller;

import com.th.bean.Permission;
import com.th.bean.ZTree;
import com.th.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @GetMapping("page")
    public String permissionPage() {
        return "permission";
    }

    @PostMapping("by_module")
    @ResponseBody
    public List<ZTree> permissionsByModule(Integer mid) {
        System.out.println(mid);
        List<Permission> permissionList = permissionService.listByModule(mid);
        List<ZTree> zTreeList = new ArrayList<ZTree>();
        for (Permission p : permissionList) {
            zTreeList.add(new ZTree(p.getId(), mid, p.getDesZh(), false, false, true));
        }
        return zTreeList;
    }

}
