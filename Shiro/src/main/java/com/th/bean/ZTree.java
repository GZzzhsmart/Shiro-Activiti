package com.th.bean;


public class ZTree {

    // module id 1 pid 0
    // permission id 1 pid 1

    private Integer id; // 权限id
    private Integer pId; // 模块id
    private String name; // 权限名称-中文描述名
    private Boolean open;
    private Boolean isParent;
    private Boolean checked;

    public ZTree() {}

    public ZTree(Integer id, Integer pId, String name, Boolean open, Boolean isParent, Boolean checked) {
        this.id = id;
        this.pId = pId;
        this.name = name;
        this.open = open;
        this.isParent = isParent;
        this.checked = checked;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public Boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(Boolean isParent) {
        isParent = isParent;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }
}
