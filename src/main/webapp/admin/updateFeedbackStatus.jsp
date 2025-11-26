<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.util.DBUtil" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>

<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");

    if(id != null && status != null){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement("UPDATE feedback SET status=? WHERE id=?");
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(id));

            ps.executeUpdate();
            response.sendRedirect("manage_feedback.jsp");

        } catch(Exception e){
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid feedback ID or status.</p>");
    }
%>
  