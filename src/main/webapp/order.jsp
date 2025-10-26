<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Your Order</title>
<link rel="stylesheet" href="./CSS1/order.css">
</head>
<body>
<%
    String username = (String) session.getAttribute("user");
    if (username == null) {
%>
    <div class="login-warning">
        <h2>⚠ Please login before placing an order!</h2>
        <a href="login.jsp">Go to Login</a>
        <br><br>
        <a href="Menu.jsp">← Back to Menu</a>
    </div>
<%
    } else {
      
        String itemName = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
%>
    <div class="order-container">
        <h1>Confirm Your Order</h1>
        <form action="ConfirmOrder.jsp" method="post">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="itemName" value="<%= itemName %>">
            <input type="hidden" name="price" value="<%= price %>">

            <p><b>Item:</b> <%= itemName %></p>
            <p><b>Price per Item:</b> ₹<%= price %></p>

            <label>Quantity:</label>
            <input type="number" name="quantity" min="1" value="1" id="qty" required><br><br>

            <label>Delivery Address:</label><br>
            <textarea name="address" rows="4" cols="40" placeholder="Enter your address" required></textarea><br><br>

            <p><b>Total Bill:</b> ₹<span id="total"><%= price %></span></p>

            <button type="submit">Confirm Order</button>
        </form>
        <a href="Menu.jsp" class="back-link">← Back to Menu</a>
    </div>

    <script>
        // JS to update total bill when quantity changes
        const qty = document.getElementById("qty");
        const total = document.getElementById("total");
        const price = <%= price %>;

        qty.addEventListener("input", () => {
            const q = parseInt(qty.value || 1);
            total.textContent = (price * q).toFixed(2);
        });
    </script>
<%
    }
%>
</body>
</html>