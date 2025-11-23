<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
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
        form input[type="email"], 
        form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            background-color: #ff6600;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form input[type="submit"]:hover {
            background-color:#ff6600 ;
        }

        a {
            display: block;
            width: 100px;
            margin: 20px auto 0;
            text-align: center;
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
    String user = "root";
    String pass = "teju132005";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();

        if(request.getMethod().equalsIgnoreCase("POST")) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");

            stmt.executeUpdate("UPDATE users SET fullname='"+fullname+"', email='"+email+"', phone='"+phone+"', username='"+username+"' WHERE id="+id);
            response.sendRedirect("manage_users.jsp");
        }

        rs = stmt.executeQuery("SELECT * FROM users WHERE id="+id);
        if(rs.next()){
%>
<h2>Edit User</h2>
<form method="post">
    Full Name: <input type="text" name="fullname" value="<%= rs.getString("fullname") %>" required><br>
    Email: <input type="email" name="email" value="<%= rs.getString("email") %>" required><br>
    Phone: <input type="text" name="phone" value="<%= rs.getString("phone") %>"><br>
    Username: <input type="text" name="username" value="<%= rs.getString("username") %>" required><br>
    <input type="submit" value="Update">
</form>
<a href="manage_users.jsp">Back to Users</a>
<%
        }
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>

</body>
</html>
    