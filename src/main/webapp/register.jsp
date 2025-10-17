<%@ page import="com.restaurant.dao.UserDAO, com.restaurant.model.User" %>
<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        boolean success = dao.registerUser(user);

        if (success) {
            session.setAttribute("user", username);
            response.sendRedirect("index.jsp");
            return;
        } else {
            message = "Username already exists! Try another one.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Restaurant System</title>
    <link rel="stylesheet" href="./CSS1/styles.css">
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h2>Register</h2>
            <form method="post">
                <input type="text" name="username" placeholder="Create Username" required><br>
                <input type="password" name="password" placeholder="Create Password" required><br>
                <button type="submit">Register</button>
            </form>
            <p class="error"><%= message %></p>
            <p>Already have an account? <a href="login.jsp">Login Here</a></p>
        </div>
    </div>
</body>
</html>