<%-- 
    Document   : viewCart
    Created on : Dec 12, 2021, 8:36:22 PM
    Author     : Admin
--%>

<%@page import="sample.shopping.TeaDTO"%>
<%@page import="sample.shopping.CartDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View cart Page</title>
    </head>
    <body>
        <h1>Your selected tea:</h1>
        <%
            CartDTO cart= (CartDTO) session.getAttribute("CART");
            if (cart!= null) {
                %>
                <table border="1" >
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count=1;
                            double total=0;
                            for (TeaDTO tea: cart.getCart().values()){
                                total+= tea.getQuantity()* tea.getPrice();
                        %>
                    <form action="MainController" >
                        <tr>
                            <td><%= count++ %></td>
                            <td>
                                <%= tea.getId()%>
                                <input type="hidden" name="id" value="<%= tea.getId()%>"/>
                            </td>
                            <td><%= tea.getName() %></td>
                            <td><%= tea.getPrice() %> $</td>
                            <td>
                                
                                <input type="number" name="quantity" value="<%= tea.getQuantity() %>" required="" min="1"/>
                            </td>
                            <td><%= tea.getQuantity()* tea.getPrice() %> $</td>
                            <td>
                                <input type="submit" name="action" value="Remove"/>
                            </td>
                            <td>
                                <input type="submit" name="action" value="Edit"/>
                            </td>
                        </tr>
                    </form>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                    <h1> Total:<%= total %> $</h1>
        <%
                    
                }
        %>
        <a href="shopping.jsp">Add more</a>
        <form action="MainController">
            <input type="submit" name="action" value="CheckOut"/>
                
        </form>
    </body>
</html>
