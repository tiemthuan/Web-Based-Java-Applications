<%-- 
    Document   : shopping
    Created on : Dec 12, 2021, 6:30:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1>Welcome to our farm!</h1>
        <form action="MainController">
            Choose your milk tea:
            <select name="cmbTea">
                <option value="T01-Pink Tea- 40">Pink Tea</option>
                <option value="T02-Bubble Tea- 60">Bubble Tea-</option>
                <option value="T03-Olong Tea- 90">Olong Tea</option>
                
            </select>
            <input type="number" name="quantity" value="1" required="" min="1"/>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="View"/>
            
        </form>
        <%
            String message= (String) request.getAttribute("MESSAGE");
            if (message== null) message="";
      
        %>
        <%= message %>
        <a href="login.html">Home page</a>
    </body>
</html>
