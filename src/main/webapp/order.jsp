<%@ page import="com.restaurant.dao.OrderDAO, com.restaurant.model.Order" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String message = null;

    // When form is submitted (POST method)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = (String) session.getAttribute("username"); // user logged in
        if (username == null) {
            message = "⚠️ Please login before placing an order!";
        } else {
            String itemName = request.getParameter("itemName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String address = request.getParameter("address");

            com.restaurant.model.Order order = new com.restaurant.model.Order(username, itemName, quantity, address);
            com.restaurant.dao.OrderDAO dao = new com.restaurant.dao.OrderDAO();

            boolean success = dao.saveOrder(order);
            if (success) {
                message = "✅ Order placed successfully!";
            } else {
                message = "❌ Failed to place order. Try again.";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Your Order</title>
<link rel="stylesheet" href="./CSS1/order.css">
</head>
<body>
    <div class="order-container">
        <h2>Confirm Your Order</h2>

        <% if (message != null) { %>
            <p><%= message %></p>
        <% } else { %>
            <form method="post">
                <p><b>Item:</b> <%= request.getParameter("name") %></p>
                <input type="hidden" name="itemName" value="<%= request.getParameter("name") %>">

                <label>Quantity:</label>
                <input type="number" name="quantity" min="1" value="1" required><br>

                <label>Delivery Address:</label>
                <textarea name="address" rows="3" required></textarea><br>

                <button type="submit">Confirm Order</button>
            </form>
        <% } %>

        <p><a href="Menu.jsp">← Back to Menu</a></p>
    </div>
</body>
</html>
