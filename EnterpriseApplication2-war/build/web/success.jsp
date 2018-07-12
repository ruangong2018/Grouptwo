<%-- 
    Document   : success
    Created on : 2018-7-8, 11:24:06
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successful</title>
    </head>
    <body>
        <h1>创建成功</h1>
        <%
            String username=(String)request.getAttribute("username");
        %>
        <form  ACTION="crtlservlet" method ="post" >
        <input type="hidden" name="username" value="<%=username%>">
        <input type="hidden" name="hidtype" value="4">
        <input type="submit" value="返回主页"></form>
    </body>
</html>
