<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.MenuDAO" %>
<%@ page import="com.restaurant.model.MenuItem" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Menu</title>
    <link rel="stylesheet" href="../CSS1/manageMenu.css">
</head>
<body>

    <h2>Manage Menu</h2>

    <div class="add-btn-container">
    	<a href="addItem.jsp" class="add-btn">Add New Menu Item</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>

        <%
            MenuDAO dao = new MenuDAO();
            List<MenuItem> items = dao.getAllMenuItems();
            
            for (MenuItem item : items) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getCategory() %></td>
            <td>₹<%= item.getPrice() %></td>
            <td><%= item.getDescription() %></td>
            <td>
                <a href="editMenu.jsp?id=<%= item.getId() %>" class="edit-btn">Edit</a>
                <a href="deleteMenu.jsp?id=<%= item.getId() %>" 
                   class="delete-btn"
                   onclick="return confirm('Are you sure you want to delete?');">
                   Delete
                </a>
            </td>
        </tr>
        <% } %>
    </table>

    <div class="back-btn-container">
    	<a href="admin_dashboard.jsp" class="back-btn">Back to Dashboard</a>
	</div>
    

</body>
</html>


<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Menu</title>
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

        .center-btn {
            text-align: center;
            margin: 20px 0;
        }

        .center-btn a {
            text-decoration:none;
            color:#fff;
            background-color:#4CAF50;
            padding:10px 20px;
            border-radius:5px;
            font-weight:bold;
        }

        .center-btn a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String pass = "teju132005"; 

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM menu");
%>

<h2>Manage Menu</h2>

<div class="center-btn">
    <a href="addItem.jsp">Add New Menu Item</a>
</div>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
<%
        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("category") %></td>
        <td><%= rs.getDouble("price") %></td>
        <td><%= rs.getString("description") %></td>
        <td>
            <a href="editMenu.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
            <a href="deleteMenu.jsp?id=<%= rs.getInt("id") %>" 
               onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>               
        </td>
    </tr>
<%
        }
%>
</table>

<div class="center-btn">
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
</div>
<br>
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