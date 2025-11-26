<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.restaurant.util.DBUtil" %>

<%
    String id = request.getParameter("id");

    if (id != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "DELETE FROM feedback WHERE id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            response.sendRedirect("manage_feedback.jsp");

        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid Feedback ID.</p>");
    }
%>
    