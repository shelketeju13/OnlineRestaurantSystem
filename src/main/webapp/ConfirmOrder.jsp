<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<link rel="stylesheet" href="./CSS1/corder.css">
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String itemName = request.getParameter("itemName");
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    String address = request.getParameter("address");

    double totalPrice = price * quantity;
    String message = "";
    boolean success = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "teju132005");

        String sql = "INSERT INTO orders (username, item_name, quantity, address, total_price) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, itemName);
        ps.setInt(3, quantity);
        ps.setString(4, address);
        ps.setDouble(5, totalPrice);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            success = true;
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        message = e.getMessage();
    }

    if (success) {
%>
    <div class="order-container">
        <h2>✅ Order Confirmed Successfully!</h2>
        <div class="bill">
            <h3>🧾 Order Bill</h3>
            <p><b>Customer:</b> <%= username %></p>
            <p><b>Item:</b> <%= itemName %></p>
            <p><b>Quantity:</b> <%= quantity %></p>
            <p><b>Price per Item:</b> ₹<%= price %></p>
            <p><b>Total Price:</b> ₹<%= totalPrice %></p>
            <p><b>Delivery Address:</b> <%= address %></p>
            <p class="thank-you">🎉 Thank you for ordering with MyRestaurant!</p>
        </div>
        <a href="Menu.jsp" class="home-btn">← Back to Menu</a>
    </div>
<%
    } else {
%>
    <div class="order-container">
        <h2>❌ Order Failed!</h2>
        <p>Something went wrong while placing your order. Please try again later.</p>
        <p><%= message %></p>
        <a href="Menu.jsp" class="home-btn">← Back to Menu</a>
    </div>
<%
    }
%>

</body>
</html>