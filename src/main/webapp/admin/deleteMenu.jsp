<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.MenuDAO" %>

<%
    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().isEmpty()) {
        out.println("<p style='color:red; text-align:center;'>Invalid Menu ID.</p>");
        return;
    }

    try {
        int id = Integer.parseInt(idParam);
        MenuDAO dao = new MenuDAO();

        boolean deleted = dao.deleteMenuItem(id);

        if (deleted) {
            response.sendRedirect("manage_menu.jsp");
        } else {
            out.println("<p style='color:red; text-align:center;'>Delete failed! Item may not exist.</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
%>
