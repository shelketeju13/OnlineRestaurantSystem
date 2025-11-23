<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("order_id");
    String status = request.getParameter("status");

    if(orderId != null && status != null){
        String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String pass = "teju132005";

        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            stmt = conn.createStatement();

            stmt.executeUpdate("UPDATE orders SET status='"+status+"' WHERE id="+orderId);
            conn.close();

            response.sendRedirect("manage_orders.jsp");
        } catch(Exception e){
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid input.</p>");
    }
%>
    