<%@ page import="com.restaurant.dao.UserDAO, com.restaurant.model.User" %>
<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        boolean valid = dao.validateUser(user);

        if (valid) {
            session.setAttribute("user", username);
            response.sendRedirect("index.jsp"); // Go to home page
            return;
        } else {
            message = "Invalid username or password!";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Restaurant System</title>
    <link rel="stylesheet" href="./CSS1/styles.css">
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
            <p class="error"><%= message %></p>
            <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
        </div>
    </div>
</body>
</html>
 