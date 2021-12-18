<%-- 
    Document   : user
    Created on : Dec 4, 2021, 7:05:47 PM
    Author     : USER
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
        %>
        <h1>Hello User:</h1>
        <%= loginUser.getUserID()%>
        <%= loginUser.getFullName()%>
        <%= loginUser.getRoleID()%>
    </body>
</html>
