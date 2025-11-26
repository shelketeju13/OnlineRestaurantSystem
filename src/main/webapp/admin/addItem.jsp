<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.restaurant.dao.MenuDAO" %>
<%@ page import="com.restaurant.model.MenuItem" %>

<%
    String message = "";
    String msgColor = "red";

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String image = request.getParameter("image");

        if (name.isEmpty() || category.isEmpty() || priceStr.isEmpty()) {
            message = "All fields except description are required!";
        } else {
            try {
                double price = Double.parseDouble(priceStr);

                MenuItem item = new MenuItem();
                item.setName(name);
                item.setCategory(category);
                item.setPrice(price);
                item.setDescription(description);
                item.setImage(image);

                MenuDAO dao = new MenuDAO();
                boolean added = dao.addMenuItem(item);

                if (added) {
                    response.sendRedirect("manage_menu.jsp");
                    return;
                } else {
                    message = "Failed to add item!";
                }

            } catch (Exception ex) {
                message = "Invalid price!";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Menu Item</title>
    <link rel="stylesheet" href="../CSS1/add_menu.css">
</head>
<body>

<h2>Add New Menu Item</h2>

<% if (!message.isEmpty()) { %>
    <p style="text-align:center;color:<%=msgColor%>;font-weight:bold;"><%=message%></p>
<% } %>

<form method="post">

    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Category:</label>
    <input type="text" name="category" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" required>

    <label>Description:</label>
    <textarea name="description"></textarea>

    <label>Image URL:</label>
    <input type="text" name="image" placeholder="image path or URL">

    <button type="submit">Add Menu Item</button>
</form>

<div class="back-container">
    <a class="back-link" href="manage_menu.jsp">Back to Menu</a>
</div>

</body>
</html>
