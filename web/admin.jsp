<%-- 
    Document   : admin
    Created on : Dec 4, 2021, 7:04:52 PM
    Author     : USER
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
          <%
        UserDTO loginUser=(UserDTO) session.getAttribute("LOGIN_USER");
        if(loginUser==null || !"AD".equals(loginUser.getRoleID())){
            response.sendRedirect("login.html");
            return;
        }
        String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome:<h1><%= loginUser.getFullName()%></h1>
        <a href="MainController?action=Logout">Logout</a>
        <form action="MainController">
            Search: <input type="text" name="search" value="<%= search %>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
            <%
           List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
             %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Status</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController">

                <tr>
                    <td><%= ++count %></td>
                    <td><%= user.getUserID()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required="" />
                    </td>
                    <td>                       
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required="" />
                    </td>
                    <td><%= user.getPassword()%></td>
                    <td><%= user.isStatus()%></td>
                    <td>
                        <a href="MainController?action= Delete&userID=<%= user.getUserID() %>&search=<%= search%>"Delete</a>                         
                    </td>
                    <td>
                        <input type="hidden" name="userID" value="<%= user.getUserID() %>"/>
                        <input type="hidden" name="search" value="<%= search %>"/>
                        <input type="submit" name="action" value="Update"/>
                        
                    </td>
                </tr>
            </form>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
             String errorMessage = (String) request.getAttribute("ERROR_MESSAGE");
             if(errorMessage == null){
                 errorMessage = "";
             }
        %>
        <%= errorMessage%>
        <%
            
                }

            }
        %>
    </body>
</html>


