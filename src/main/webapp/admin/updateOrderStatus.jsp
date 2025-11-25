<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.restaurant.util.DBUtil" %>

<%
    // Fetch parameters
    String orderId = request.getParameter("order_id");
    String status = request.getParameter("status");

    if (orderId != null && status != null) {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();

            String sql = "UPDATE orders SET status=? WHERE id=?";
            ps = conn.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(orderId));

            ps.executeUpdate();

            // Redirect back to manage orders page
            response.sendRedirect("manage_orders.jsp");

        } catch (Exception e) {
            out.println("<h3 style='color:red; text-align:center;'>Error: " + e.getMessage() + "</h3>");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

    } else {
        out.println("<h3 style='color:red; text-align:center;'>Invalid input.</h3>");
    }
%>