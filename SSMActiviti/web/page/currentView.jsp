<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看当前流程图</title>
</head>
<body>
<img style="position: absolute;top: 0px;left: 0px"  src="${pageContext.request.contextPath}/processDefinition/showView.action?deploymentId=${deploymentId}&diagramResourceName=${diagramResourceName}">

<div style="position: absolute;border: 1px solid red;top:${y-3}px;left:${x-3}px;width:${width+3}px;height:${height+3}px"></div>
</body>
</html>