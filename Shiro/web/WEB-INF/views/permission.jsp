<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="apache shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>权限管理</title>
    <link href="<%=path %>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path %>/plugins/select2/select2.min.css" rel="stylesheet"/>
    <link href="<%=path %>/plugins/select2/select2-bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path%>/plugins/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
</head>
<body class="container">
<div class="row">
    <div class="col-lg-2">
        <select id="role" name="role" class="form-control select2"></select>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <ul id="pTree" class="ztree"></ul>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <a href="javascript:void(0);" onclick="" class="btn btn-primary">保存权限</a>
    </div>
</div>
</body>
<script src="<%=path %>/plugins/jquery.min.js"></script>
<script src="<%=path %>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/select2/i18n/zh-CN.js"></script>
<script src="<%=path %>/plugins/select2/select2.min.js"></script>
<script src="<%=path %>/plugins/zTree/jquery.ztree.all.min.js"></script>
<script>

    /**
     * [{'id':1,'pId':0, 'name':'text', 'open':false, 'isParent':true}]
     * 适用于带有父子关系的数据, 并且更加适用于一次性把所有数据查询出来的情况
     *
     * t_city
     * id   parent_id  name
     * 1     0         中国
     * 2     1          江西省
     * 3     2          赣州市
     *
     *
     * t_module
     *
     * t_permission
     *
     * @type {{check: {enable: boolean}, data: {simpleData: {enable: boolean, idKey: string, pIdKey: string, rootId: number}}, async: {enable: boolean, url: string, method: string, autoParam: [*]}}}
     */
    var setting = {
        check: {
            enable: true
        },
        data: { // 树的数据的形式
            simpleData: {
                enable: true,
                idKey: "id", // id编号命名
                pIdKey: "pId", // 父id编号命名
                rootId: 0
            }
        },
        async: {
            enable: true,
            url: '<%=path %>/permission/by_module',
            method: 'post',
            autoParam: ["id=mid"]
        }
    };

    $(function() {
        // 去获取角色的json数据
        $.get("<%=path %>/role/all",
            function (data) {
                $("#role").select2(
                    {
                        data:data,
                        placeholder:'请选择',
                        allowClear:false
                    }
                );
            }, "json"
        );

        $.get("<%=path %>/module/all",
            function (data) {
                $.fn.zTree.init($('#pTree'), setting, data);
            }, "json"
        );

    });


</script>
</html>
