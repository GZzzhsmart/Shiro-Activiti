<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>老板审核页面</title>
</head>
<body>
<table>
    <c:forEach items="${bossTaskList}" var="bossTask">
        <tr>
            <td>${bossTask.taskId}</td>
            <td>${bossTask.taskName}</td>
            <td>${bossTask.empName}</td>
            <td>${bossTask.days}</td>
            <td>${bossTask.reason}</td>
            <td>${bossTask.datetime}</td>
            <td><a href="<%=path%>/activiti/check/${bossTask.taskId}">同意</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
