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
