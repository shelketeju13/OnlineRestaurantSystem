<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.UserDAO, com.restaurant.model.User" %>

<%
    String id = request.getParameter("id");
    UserDAO dao = new UserDAO();
    User user = null;
    String msg = "";

    if (id != null) {
        user = dao.getUserDetailsById(id);  
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");

        User updated = new User(id, fullname, email, phone, username);

        if (dao.updateUser(updated)) {
            response.sendRedirect("manage_users.jsp?updated=1");
            return;
        } else {
            msg = "Update failed!";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="../CSS1/edituser.css">
</head>
<body>

<h2>Edit User</h2>

<div class="form-container">
    
    <p class="msg success"><%= msg %></p>

    <form method="post">

        <label>Full Name</label>
        <input type="text" name="fullname" value="<%= user.getFullname() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<%= user.getPhone() %>">

        <label>Username</label>
        <input type="text" name="username" value="<%= user.getUsername() %>" required>

        <button type="submit">Update User</button>

    </form>

</div>

<div class="back-container">
    <a href="manage_users.jsp" class="back-link">Back to Users</a>
</div>

</body>
</html>
