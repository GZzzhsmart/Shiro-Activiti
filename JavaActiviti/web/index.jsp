<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>请假流程</title>
</head>
<body>
<a href="<%=path %>/activiti/deploy/leave_process_complex">部署请假流程</a>

<a href="<%=path %>/activiti/to_leave">我要请假</a>
<a href="<%=path %>/activiti/boss_checks">老板审核</a>
</body>
</html>
