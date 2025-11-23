<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        text-align: center;
        padding-top: 120px;
    }
    .box {
        display: inline-block;
        background: #fff;
        padding: 35px 60px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.15);
    }
    .success {
        font-size: 24px;
        font-weight: bold;
        color: green;
        margin-bottom: 10px;
    }
    a {
        font-size: 18px;
        text-decoration: none;
        color: #007bff;
    }
</style>
<meta http-equiv="refresh" content="2;URL=index.jsp" />
</head>

<body>

<div class="box">
    <p class="success">✔ Logged Out Successfully!</p>
    <p>Redirecting to Home Page...</p>
    <a href="index.jsp">Click here if not redirected</a>
</div>

</body>
</html>
