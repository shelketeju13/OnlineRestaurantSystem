<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.dao.UserDAO" %>
<%@ page import="com.restaurant.model.User" %>

<%
    UserDAO dao = new UserDAO();
    List<User> list = dao.getAllUsers();
%>

<!DOCTYPE html>       
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <link rel="stylesheet" href="../CSS1/user.css">
</head>
<body>

<h2>All Users</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Password</th>
        <th>Action</th>
    </tr>

    <%
        for (User u : list) {
    %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getFullname() %></td>
        <td><%= u.getEmail() %></td>
        <td><%= u.getPhone() %></td>
        <td><%= u.getUsername() %></td>
        <td><%= u.getPassword() %></td>
        <td>
            <a class="edit-btn" href="editUser.jsp?id=<%= u.getId() %>">Edit</a> |
            <a class="delete-btn" href="deleteUser.jsp?id=<%= u.getId() %>" 
               onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<div class="back-btn-container">
    <a class="back-btn" href="admin_dashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
