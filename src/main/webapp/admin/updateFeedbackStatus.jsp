<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");

    if(id != null && status != null){
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true", "root", "teju132005");
            stmt = conn.createStatement();
            stmt.executeUpdate("UPDATE feedback SET status='" + status + "' WHERE id=" + id);
            response.sendRedirect("manage_feedback.jsp");
        } catch(Exception e){
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(stmt!=null) stmt.close();
            if(conn!=null) conn.close();
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid feedback ID or status.</p>");
    }
%>
    