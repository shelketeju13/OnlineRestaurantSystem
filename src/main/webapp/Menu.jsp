<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.MenuDAO, com.restaurant.model.MenuItem, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu - MyRestaurant</title>
<link rel="stylesheet" href="./CSS1/menu.css">
</head>
<body>
<div class="container">
  <aside class="sidebar">
    <h2>MyRestaurant</h2>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="Menu.jsp" class="active">Menu</a></li>
      <li><a href="about.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
      <li><a href="login.jsp">Login / Register</a></li>
    </ul>
  </aside>

  <main class="content">
    <h1>Our Menu</h1>

    <div class="menu-categories">
      <%
        String category = request.getParameter("category");
        String[] categories = {"Meals", "Desserts", "Drinks", "Snacks"};
        for (String cat : categories) {
            String activeClass = (category != null && category.equals(cat)) ? "active" : "";
      %>
          <a href="Menu.jsp?category=<%= cat %>" class="<%= activeClass %>"><%= cat %></a>
      <% } %>
    </div>

    <%
      MenuDAO dao = new MenuDAO();
      List<MenuItem> items;

      if (category != null) {
          items = dao.getMenuItemsByCategory(category);
          out.println("<h2>" + category + "</h2>");
      } else {
          items = dao.getAllMenuItems();
          out.println("<h2>All Items</h2>");
      }

      if (items.isEmpty()) {
    %>
        <p class="no-items">No items found for this category.</p>
    <%
      } else {
    %>
        <div class="menu-list">
          <% for(MenuItem item : items) { %>
            <div class="menu-item">
              <h3><%= item.getName() %></h3>
              <p><%= item.getDescription() %></p>
              <p class="price">₹<%= item.getPrice() %></p>

              <form action="order.jsp" method="get">
                 <input type="hidden" name="id" value="<%= item.getId() %>">
                 <input type="hidden" name="name" value="<%= item.getName() %>">
                 <input type="hidden" name="price" value="<%= item.getPrice() %>">
                 <button type="submit">Order Now</button>
              </form>
            </div>
          <% } %>
        </div>
    <%
      }
    %>
  </main>
</div>

<footer>
  <p>&copy; 2025 MyRestaurant. All rights reserved.</p>
</footer>
</body>
</html>