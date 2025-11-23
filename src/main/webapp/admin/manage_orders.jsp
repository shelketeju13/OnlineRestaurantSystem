<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 20px; }
        h2 { text-align: center; color: #333; }
        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        table th, table td { padding: 12px 15px; border-bottom: 1px solid #ddd; }
        table th { background-color: #4CAF50; color: white; text-transform: uppercase; }
        table tr:hover { background-color: #f1f1f1; }
        select, input[type="submit"] { padding: 6px 10px; border-radius: 4px; border: 1px solid #ccc; cursor: pointer; }
        input[type="submit"] { background-color: #4CAF50; color: white; border: none; }
        input[type="submit"]:hover { background-color: #45a049; }
        .center-btn { text-align: center; margin: 20px 0; }
        .center-btn a { text-decoration:none; color:#fff; background-color:#4CAF50; padding:10px 20px; border-radius:5px; font-weight:bold; }
        .center-btn a:hover { background-color: #45a049; }
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

        rs = stmt.executeQuery("SELECT * FROM orders ORDER BY order_date DESC");
%>

<h2>Manage Orders</h2>


<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Username</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Address</th>
        <th>Total Price</th>
        <th>Order Date</th>
        <th>Status</th>
        <th>Update Status</th>
    </tr>
<%
        while(rs.next()){
            String status = rs.getString("status") != null ? rs.getString("status") : "Pending";
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("item_name") %></td>
        <td><%= rs.getInt("quantity") %></td>
        <td><%= rs.getString("address") %></td>
        <td>₹<%= rs.getDouble("total_price") %></td>
        <td><%= rs.getTimestamp("order_date") %></td>
        <td><%= status %></td>
        <td>
            <form method="post" action="updateOrderStatus.jsp">
                <input type="hidden" name="order_id" value="<%= rs.getInt("id") %>">
                <select name="status">
                    <option value="Pending" <%= status.equals("Pending")?"selected":"" %>>Pending</option>
                    <option value="Preparing" <%= status.equals("Preparing")?"selected":"" %>>Preparing</option>
                    <option value="Delivered" <%= status.equals("Delivered")?"selected":"" %>>Delivered</option>
                </select>
                <input type="submit" value="Update">
            </form>
        </td>
    </tr>
<%
        }
%>
</table>

<div class="center-btn">
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
</div>

<%
    } catch(Exception e){
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>

</body>
</html>
    