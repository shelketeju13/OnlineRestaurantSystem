<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int totalUsers = 0;
    int totalMenuItems = 0;
    int totalOrders = 0;
    double totalRevenue = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/restaurant_db","root","teju132005"
        );

        PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) AS total FROM users");
        ResultSet rs1 = ps1.executeQuery();
        if(rs1.next()) totalUsers = rs1.getInt("total");

        PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) AS total FROM menu");
        ResultSet rs2 = ps2.executeQuery();
        if(rs2.next()) totalMenuItems = rs2.getInt("total");


        PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) AS total FROM orders");
        ResultSet rs3 = ps3.executeQuery();
        if(rs3.next()) totalOrders = rs3.getInt("total");

        PreparedStatement ps4 = con.prepareStatement("SELECT SUM(total_price) AS revenue FROM orders");
        ResultSet rs4 = ps4.executeQuery();
        if(rs4.next()) totalRevenue = rs4.getDouble("revenue");

        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="../CSS1/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="admin-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="../index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="admin_dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="manage_users.jsp"><i class="fas fa-users"></i> Manage Users</a></li>
            <li><a href="manage_menu.jsp"><i class="fas fa-utensils"></i> Manage Menu</a></li>
            <li><a href="manage_orders.jsp"><i class="fas fa-shopping-cart"></i> Manage Orders</a></li>
            <li><a href="manage_feedback.jsp"><i class="fas fa-envelope"></i> Manage Feedback</a></li>
            <li><a href="admin_logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Welcome, Admin</h1>
        <p>Here you can manage users, menu items, and customer orders.</p>
        <h1>Dashboard</h1>
        
        <div class="dashboard-boxes">
            <div class="box users-box">
                <i class="fas fa-users"></i>
                <h2>Total Users</h2>
                <p><%= totalUsers %></p>
            </div>
            <div class="box menu-box">
                <i class="fas fa-utensils"></i>
                <h2>Total Menu Items</h2>
                <p><%= totalMenuItems %></p>
            </div>
            <div class="box orders-box">
                <i class="fas fa-shopping-cart"></i>
                <h2>Total Orders</h2>
                <p><%= totalOrders %></p>
            </div>
            <div class="box revenue-box">
                <i class="fas fa-dollar-sign"></i>
                <h2>Total Revenue</h2>
                <p>$<%= totalRevenue %></p>
            </div>
        </div>
    </div>
</div>
<footer>
    © 2025 Restaurant Management System — Admin Panel
</footer>
</body>
</html>
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.AdminDashboardDAO" %>

<%
    AdminDashboardDAO dao = new AdminDashboardDAO();

    int totalUsers = dao.getTotalUsers();
    int totalMenuItems = dao.getTotalMenuItems();
    int totalOrders = dao.getTotalOrders();
    double totalRevenue = dao.getTotalRevenue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="../CSS1/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<div class="admin-container">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="../index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="admin_dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="manage_users.jsp"><i class="fas fa-users"></i> Manage Users</a></li>
            <li><a href="manage_menu.jsp"><i class="fas fa-utensils"></i> Manage Menu</a></li>
            <li><a href="manage_orders.jsp"><i class="fas fa-shopping-cart"></i> Manage Orders</a></li>
            <li><a href="manage_feedback.jsp"><i class="fas fa-envelope"></i> Manage Feedback</a></li>
            <li><a href="admin_logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Welcome, Admin</h1>
        <p>Here you can manage users, menu items, and customer orders.</p>

        <div class="dashboard-boxes">

            <div class="box users-box">
                <i class="fas fa-users"></i>
                <h2>Total Users</h2>
                <p><%= totalUsers %></p>
            </div>

            <div class="box menu-box">
                <i class="fas fa-utensils"></i>
                <h2>Total Menu Items</h2>
                <p><%= totalMenuItems %></p>
            </div>

            <div class="box orders-box">
                <i class="fas fa-shopping-cart"></i>
                <h2>Total Orders</h2>
                <p><%= totalOrders %></p>
            </div>

            <div class="box revenue-box">
                <i class="fas fa-dollar-sign"></i>
                <h2>Total Revenue</h2>
                <p><%= totalRevenue %></p>
            </div>

        </div>

    </div>

</div>

<footer>
    © 2025 Restaurant Management System — Admin Panel
</footer>

</body>
</html>

    