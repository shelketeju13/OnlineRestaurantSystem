<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Submitted - MyRestaurant</title>
<link rel="stylesheet" href="./CSS1/contact.css">
</head>
<body>
<div class="container">

    <aside class="sidebar">
        <h2>MyRestaurant</h2>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Menu.jsp">Menu</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp" class="active">Contact</a></li>
            <li><a href="login.jsp">Login / Register</a></li>
        </ul>
    </aside>

    <main class="content">
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");
    boolean success = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db", "root", "teju132005");

        String sql = "INSERT INTO feedback (name, email, subject, message) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, subject);
        ps.setString(4, message);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            success = true;
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (success) {
%>
        <div class="contact-success">
            <h1>✅ Message Sent Successfully!</h1>
            <p>Thank you, <b><%= name %></b>! Your message has been received. We’ll get back to you soon.</p>
            <a href="contact.jsp" class="btn">← Back to Contact Page</a>
        </div>
<%
    } else {
%>
        <div class="contact-fail">
            <h1>❌ Submission Failed!</h1>
            <p>Something went wrong. Please try again later.</p>
            <a href="contact.jsp" class="btn">← Back to Contact Page</a>
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
