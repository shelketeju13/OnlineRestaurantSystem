<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.AdminDAO" %>

<%
    String msg = "";
    String logoutMsg = "";

    if ("success".equals(request.getParameter("logout"))) {
        logoutMsg = "Logout Successfully!";
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        boolean valid = dao.validateAdmin(username, password);

        if (valid) {
            // Redirect to dashboard with admin name
            response.sendRedirect("admin_dashboard.jsp?admin=" + username);
            return;
        } else {
            msg = "Invalid Admin Credentials!";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet" href="../CSS1/adminLogin.css">
</head>
<body>

<div class="admin-login-container">
    <div class="login-box">
        <h2>Admin Login</h2>

        <% if (!logoutMsg.isEmpty()) { %>
            <p style="color: green; 
                      text-align:center; 
                      font-weight:bold; 
                      margin-bottom:10px;">
                <%= logoutMsg %>
            </p>
        <% } %>

        <form method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <button type="submit">Login</button>
        </form>

        <p style="color:red; margin-top:10px; text-align:center;"><%= msg %></p>
    </div>
</div>

</body>
</html>
    