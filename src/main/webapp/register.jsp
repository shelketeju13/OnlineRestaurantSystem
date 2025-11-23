<%@ page import="com.restaurant.dao.UserDAO, com.restaurant.model.User" %>

<%
    String message = "";
    String msgColor = "red";
    boolean successFlag = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(fullname, email, phone, username, password);
        UserDAO dao = new UserDAO();

        boolean success = dao.registerUser(user);

        if (success) {
            message = "Registered Successfully!";
            msgColor = "green";
            successFlag = true; 
        } else {
            message = "Username already exists!";
            msgColor = "red";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./CSS1/login.css">
    <title>Register</title>

    <style>
        .msg {
            font-size: 18px;
            margin-top: 10px;
            font-weight: bold;
        }
    </style>

    <% if (successFlag) { %>
        <meta http-equiv="refresh" content="2; URL=index.jsp">
    <% } %>

</head>
<body>
<div class="container">
    <div class="form-box">
        <h2>Register</h2>

        <form method="post">
            <input type="text" name="fullname" placeholder="Full Name" required><br>
            <input type="email" name="email" placeholder="Email Address" required><br>
            <input type="text" name="phone" placeholder="Phone Number" required><br>
            <input type="text" name="username" placeholder="Create Username" required><br>
            <input type="password" name="password" placeholder="Create Password" required><br>
            <button type="submit">Register</button>
        </form>

        <p class="msg" style="color:<%= msgColor %>;"><%= message %></p>

        <p>Already have an account? <a href="login.jsp">Login Here</a></p>
    </div>
</div>
</body>
</html>

