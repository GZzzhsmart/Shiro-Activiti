<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="<%=path %>/user/login" method="post">
        <input type="text" name="name" />
        <input type="password" name="password" />
        <input type="submit" />
    </form>
</body>
</html>
