<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.restaurant.dao.FeedbackDAO" %>
<%@ page import="com.restaurant.model.Feedback" %>
<%@ page import="java.util.List" %>

<%
   
    FeedbackDAO dao = new FeedbackDAO();
    List<Feedback> feedbackList = dao.getAllFeedback();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Feedback</title>
<link rel="stylesheet" href="../CSS1/manage_feedback.css">
</head>

<body>

<div class="container">
    <h1>Manage Feedback</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <%
                if (feedbackList != null && !feedbackList.isEmpty()) {
                    for (Feedback fb : feedbackList) {
            %>
            <tr>
                <td><%= fb.getId() %></td>
                <td><%= fb.getName() %></td>
                <td><%= fb.getEmail() %></td>
                <td><%= fb.getSubject() %></td>
                <td><%= fb.getMessage() %></td>
                <td><%= fb.getSubmittedAt() %></td>
                <td><%= fb.getStatus() %></td>

                <td style="white-space: nowrap;">

    		    	<form action="updateFeedbackStatus.jsp" method="post" style="display:inline-block;">
        				<input type="hidden" name="id" value="<%= fb.getId() %>">

        				<select name="status" class="status-dropdown">
            			<option value="Pending" <%= fb.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
            			<option value="Read" <%= fb.getStatus().equals("Read") ? "selected" : "" %>>Read</option>
            			<option value="Resolved" <%= fb.getStatus().equals("Resolved") ? "selected" : "" %>>Resolved</option>
        				</select>

        				<button type="submit" class="update-btn">Update</button>
   					</form>

    				<form action="deleteFeedback.jsp" method="post" style="display:inline-block;"
        				onsubmit="return confirm('Are you sure you want to delete this feedback?');">
        				<input type="hidden" name="id" value="<%= fb.getId() %>">
       					<button type="submit" class="delete-btn">Delete</button>
   				 	</form>

				</td>
                
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="8" style="text-align:center;">No Feedback Found</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="admin_dashboard.jsp" class="backBtn">Back to Dashboard</a>

</div>

</body>
</html>