<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Feedback</title>
    <style>
        body { font-family: Arial; background-color: #f9f9f9; padding: 20px; }
        h2 { text-align: center; color: #333; }
        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th { background-color: #4CAF50; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .center-btn { text-align: center; margin: 20px 0; }
        .center-btn a { text-decoration:none; color:#fff; background-color:#4CAF50; padding:10px 20px; border-radius:5px; font-weight:bold; }
        .center-btn a:hover { background-color: #45a049; }
        .status-Pending { color: orange; font-weight: bold; }
        .status-Read { color: blue; font-weight: bold; }
        .status-Resolved { color: green; font-weight: bold; }
        .delete-btn { color: white; background-color: #f44336; padding: 5px 10px; text-decoration:none; border-radius: 4px; }
        .delete-btn:hover { background-color: #d32f2f; }
        select { padding: 4px; border-radius: 4px; }
        input[type=submit] { padding: 4px 8px; border-radius: 4px; background-color:#4CAF50; color:white; border:none; cursor:pointer; }
        input[type=submit]:hover { background-color: #45a049; }
    </style>
</head>
<body>

<h2>Manage Feedback Messages</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Status</th>
        <th>Submitted At</th>
        <th>Actions</th>
    </tr>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true", "root", "teju132005");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM feedback ORDER BY submitted_at DESC");

        while(rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String subject = rs.getString("subject");
            String message = rs.getString("message");
            String status = rs.getString("status");
            Timestamp date = rs.getTimestamp("submitted_at");
%>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= email %></td>
        <td><%= subject %></td>
        <td><%= message %></td>
        <td class="status-<%= status %>">
            <form method="post" action="updateFeedbackStatus.jsp">
                <input type="hidden" name="id" value="<%= id %>">
                <select name="status">
                    <option value="Pending" <%= status.equals("Pending") ? "selected" : "" %>>Pending</option>
                    <option value="Read" <%= status.equals("Read") ? "selected" : "" %>>Read</option>
                    <option value="Resolved" <%= status.equals("Resolved") ? "selected" : "" %>>Resolved</option>
                </select>
                <input type="submit" value="Update">
            </form>
        </td>
        <td><%= date %></td>
        <td>
            <a class="delete-btn" href="deleteFeedback.jsp?id=<%= id %>"
   onclick="return confirm('Are you sure you want to delete this feedback?');">
   Delete</a>
        </td>
    </tr>
<%
        }

    } catch(Exception e){
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>

</table>
<div class="center-btn">
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
    