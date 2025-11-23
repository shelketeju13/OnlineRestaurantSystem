<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.UserDAO" %>

<%
    String id = request.getParameter("id");
    UserDAO dao = new UserDAO();
    dao.deleteUser(id);
    response.sendRedirect("manage_users.jsp");
%>

 <%-- 
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/restaurant_db";
    String user = "root";
    String pass = "teju132005";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("DELETE FROM users WHERE id="+id);
        conn.close();
        response.sendRedirect("manage_users.jsp");
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
%>
 --%>  