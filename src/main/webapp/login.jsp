<%@ page import="com.restaurant.dao.UserDAO, com.restaurant.model.User" %>

<%
    String message = "";
    String msgColor = "red";
    boolean successFlag = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(null, null, null, username, password);
        UserDAO dao = new UserDAO();

        boolean valid = dao.validateUser(user);

        if (valid) {
            session.setAttribute("user", username);   
            message = "Login Successful!";
            msgColor = "green";
            successFlag = true;

        } else {
            message = "Invalid username or password!";
            msgColor = "red";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="./CSS1/login.css">

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
        <h2>Login</h2>

        <form method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <button type="submit">Login</button>
        </form>

        <p class="msg" style="color:<%= msgColor %>;"><%= message %></p>

        <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
    </div>
</div>
</body>
</html>

