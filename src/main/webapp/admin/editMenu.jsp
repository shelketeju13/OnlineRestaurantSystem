<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Menu Item</title>
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

        form {
            width: 50%;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        form input[type="text"], 
        form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
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
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String pass = "teju132005"; // replace with your MySQL password

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();

        // Update item if POST
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String description = request.getParameter("description");

            stmt.executeUpdate("UPDATE menu SET name='"+name+"', category='"+category+"', price="+price+", description='"+description+"' WHERE id="+id);
            response.sendRedirect("manage_menu.jsp");
        }

        rs = stmt.executeQuery("SELECT * FROM menu WHERE id="+id);
        if(rs.next()){
%>

<h2>Edit Menu Item</h2>
<form method="post">
    Name: <input type="text" name="name" value="<%= rs.getString("name") %>" required><br>
    Category: <input type="text" name="category" value="<%= rs.getString("category") %>"><br>
    Price: <input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" required><br>
    Description: <textarea name="description"><%= rs.getString("description") %></textarea><br>
    <input type="submit" value="Update">
</form>

<div class="center-btn">
    <a href="manage_menu.jsp">Back to Menu</a>
</div>

<%
        }
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
    