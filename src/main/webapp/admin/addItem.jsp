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

<%-- 
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Menu Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            width: 50%;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        form input[type="text"], 
        form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        .center-btn {
            text-align: center;
            margin: 20px 0;
        }

        .center-btn a {
            text-decoration:none;
            color:#fff;
            background-color:#4CAF50;
            padding:10px 20px;
            border-radius:5px;
            font-weight:bold;
        }

        .center-btn a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String pass = "teju132005"; // replace with your MySQL password

    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();

        // Insert item if POST
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String description = request.getParameter("description");

            stmt.executeUpdate("INSERT INTO menu (name, category, price, description) VALUES ('"+name+"', '"+category+"', "+price+", '"+description+"')");
            response.sendRedirect("manage_menu.jsp");
        }
%>

<h2>Add New Menu Item</h2>
<form method="post">
    Name: <input type="text" name="name" required><br>
    Category: <input type="text" name="category"><br>
    Price: <input type="number" step="0.01" name="price" required><br>
    Description: <textarea name="description"></textarea><br>
    <input type="submit" value="Add Menu Item">
</form>

<div class="center-btn">
    <a href="manage_menu.jsp">Back to Menu</a>
</div>

<%
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>

</body>
</html>
 --%>   