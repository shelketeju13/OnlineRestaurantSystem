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

<table border="1" cellpadding="10">
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
            <a href="editUser.jsp?id=<%= u.getId() %>">Edit</a> |
            <a href="deleteUser.jsp?id=<%= u.getId() %>"
               onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<div style="text-align: center; margin: 20px 0;">
    <a href="admin_dashboard.jsp" 
       style="text-decoration:none; color:#fff; background-color:#4CAF50; 
              padding: 10px 20px; border-radius: 5px; font-weight: bold;">
        Back to Dashboard
    </a>
</div>

</body>
</html>
 
<%-- 
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            background-color: #fff;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
            text-transform: uppercase;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/restaurant_db";
    String user = "root";
    String pass = "teju132005";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM users");
%>

<h2>Manage Users</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Username</th>
        <th>Actions</th>
    </tr>
    <%
        while(rs.next()){
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("fullname") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("username") %></td>
        <td>
            <a href="editUser.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
            <a href="deleteUser.jsp?id=<%= rs.getInt("id") %>" 
               onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<div style="text-align: center; margin: 20px 0;">
    <a href="admin_dashboard.jsp" 
       style="text-decoration:none; color:#fff; background-color:#4CAF50; 
              padding: 10px 20px; border-radius: 5px; font-weight: bold;">
        Back to Dashboard
    </a>
</div>

<%
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>

</body>
</html>
    --%>