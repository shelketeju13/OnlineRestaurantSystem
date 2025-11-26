<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.MenuDAO" %>
<%@ page import="com.restaurant.model.MenuItem" %>
<%
    String message = "";
    String msgColor = "red";

    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        message = "Invalid Menu Item!";
    }

    MenuDAO dao = new MenuDAO();
    MenuItem item = null;

    try {
        item = dao.getMenuItemById(Integer.parseInt(idParam));
    } catch (Exception e) {
        message = "Menu Item Not Found!";
    }

    if ("POST".equalsIgnoreCase(request.getMethod()) && item != null) {

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");

        if (name.isEmpty() || category.isEmpty() || priceStr.isEmpty()) {
            message = "All fields except description are required!";
        } else {
            try {
                double price = Double.parseDouble(priceStr);

                item.setName(name);
                item.setCategory(category);
                item.setPrice(price);
                item.setDescription(description);

                boolean updated = dao.updateMenuItem(item);

                if (updated) {
                    response.sendRedirect("manage_menu.jsp");
                    return;
                } else {
                    message = "Update Failed!";
                }

            } catch (Exception ex) {
                message = "Invalid Price!";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Menu Item</title>
    <link rel="stylesheet" href="../CSS1/edit_menu.css">
</head>

<body>

<h2>Edit Menu Item</h2>

<% if (!message.isEmpty()) { %>
    <p style="text-align:center; color:<%= msgColor %>; font-weight:bold;"><%= message %></p>
<% } %>

<% if (item != null) { %>

<form method="post">

    <label>Name:</label>
    <input type="text" name="name" value="<%= item.getName() %>" required>

    <label>Category:</label>
    <input type="text" name="category" value="<%= item.getCategory() %>" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="<%= item.getPrice() %>" required>

    <label>Description:</label>
    <textarea name="description"><%= item.getDescription() %></textarea>

    <button type="submit" class="update-btn">Update Item</button>
    
</form>

<div class="back-container">
    <a href="manage_menu.jsp" class="back-btn">Back to Menu</a>
</div>

<% } %>

</body>
</html>
