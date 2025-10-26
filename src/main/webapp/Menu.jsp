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

    <form method="get" action="Menu.jsp" class="filter-form">
    
     <input type="hidden" name="category" value="<%= request.getParameter("category") != null ? request.getParameter("category") : "" %>">
  
      <input type="text" name="search" placeholder="Search food (e.g. Pizza, Burger)" 
             value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

      <input type="number" name="minPrice" placeholder="Min ₹" 
             value="<%= request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "" %>">

      <input type="number" name="maxPrice" placeholder="Max ₹" 
             value="<%= request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "" %>">

      <select name="sort">
        <option value="">Sort by Price</option>
        <option value="low" <%= "low".equals(request.getParameter("sort")) ? "selected" : "" %>>Low → High</option>
        <option value="high" <%= "high".equals(request.getParameter("sort")) ? "selected" : "" %>>High → Low</option>
      </select>

      <button type="submit">Apply</button>
    </form>

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

      String search = request.getParameter("search");
      String minStr = request.getParameter("minPrice");
      String maxStr = request.getParameter("maxPrice");
      String sort = request.getParameter("sort");

      Double min = (minStr != null && !minStr.isEmpty()) ? Double.parseDouble(minStr) : null;
      Double max = (maxStr != null && !maxStr.isEmpty()) ? Double.parseDouble(maxStr) : null;

      if (category != null && !category.isEmpty()) {
          items = dao.getMenuItemsByCategory(category);
      } else {
          items = dao.getAllMenuItems();
      }

      if (search != null && !search.isEmpty()) {
          items.removeIf(i -> !i.getName().toLowerCase().contains(search.toLowerCase()));
      }

      if (min != null && max != null) {
          items.removeIf(i -> i.getPrice() < min || i.getPrice() > max);
      } else if (min != null) {
          items.removeIf(i -> i.getPrice() < min);
      } else if (max != null) {
          items.removeIf(i -> i.getPrice() > max);
      }

      if ("low".equals(sort)) {
          items.sort(Comparator.comparingDouble(MenuItem::getPrice));
      } else if ("high".equals(sort)) {
          items.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice()));
      }

      if (items.isEmpty()) {
    %>
        <p class="no-items">No items found for this category or filter.</p>
    <%
      } else {
    %>
        <div class="menu-list">
          <% for(MenuItem item : items) { %>
            <div class="menu-item">
              <!--  <img src="images/<%= item.getImage() %>" alt="<%= item.getName() %>" width="200" height="150">-->
              <img src="<%=request.getContextPath()%>/images/<%= item.getImage() %>" alt="<%= item.getName() %>" width="200" height="150">
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
