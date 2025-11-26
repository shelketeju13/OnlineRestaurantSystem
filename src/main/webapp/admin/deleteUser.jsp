<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.UserDAO" %>

<%
    String id = request.getParameter("id");
    UserDAO dao = new UserDAO();
    dao.deleteUser(id);
    response.sendRedirect("manage_users.jsp");
%>

