<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    if (id != null && !id.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "teju132005"
            );

            ps = conn.prepareStatement("DELETE FROM feedback WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("manage_feedback.jsp");
            } else {
                out.println("<p style='color:red; text-align:center;'>No feedback found with this ID.</p>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid feedback ID.</p>");
    }
%>
    