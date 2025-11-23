<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    if(id != null && !id.isEmpty()){
        String url = "jdbc:mysql://localhost:3306/restaurant_db?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String pass = "teju132005"; 

        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            stmt = conn.createStatement();
            
            int rows = stmt.executeUpdate("DELETE FROM menu WHERE id=" + id);
            
            if(rows > 0){
                response.sendRedirect("manage_menu.jsp");
            } else {
                out.println("<p style='color:red; text-align:center;'>Menu item not found or could not be deleted.</p>");
            }

        } catch(Exception e){
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Invalid menu item ID.</p>");
    }
%>

</body>
</html>
    