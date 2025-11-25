<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.dao.OrderDAO" %>
<%@ page import="com.restaurant.model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <link rel="stylesheet" href="../CSS1/manageOrders.css">
</head>

<body>

<%
    OrderDAO dao = new OrderDAO();
    List<Order> orders = dao.getAllOrders();
%>

<h2>Manage Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>Username</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Address</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Update</th>
    </tr>

<%
    for (Order o : orders) {
%>

<tr>
    <td><%= o.getId() %></td>
    <td><%= o.getUsername() %></td>
    <td><%= o.getItemName() %></td>
    <td><%= o.getQuantity() %></td>
    <td><%= o.getAddress() %></td>
    <td>₹<%= o.getPrice() %></td>
    <td><%= o.getStatus() %></td>

    <td>
        <form action="updateOrderStatus.jsp" method="post">
            <input type="hidden" name="order_id" value="<%= o.getId() %>">

            <select name="status">
                <option value="Pending" <%= o.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                <option value="Preparing" <%= o.getStatus().equals("Preparing") ? "selected" : "" %>>Preparing</option>
                <option value="Delivered" <%= o.getStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
            </select>

            <input type="submit" value="Update" class="update-btn">
        </form>
    </td>
</tr>

<% } %>

</table>

<div class="back-btn-container">
    <a href="admin_dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>