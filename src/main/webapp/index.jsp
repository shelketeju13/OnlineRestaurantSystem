<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="./CSS1/style.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<div class="container">
        <div class="sidebar">
            <h2><i class="fas fa-utensils"></i> MyRestaurant</h2>

            <ul>
                <li><a href="index.jsp" class="active"> <i class="fas fa-home"></i> Home</a></li>
                <li><a href="Menu.jsp"><i class="fas fa-bars"></i> Menu</a></li>
                <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
                <li><a href="contact.jsp"><i class="fas fa-phone-alt"></i> Contact</a></li>
                <li><a href="login.jsp"><i class="fas fa-user"></i> Login / Register</a></li>
                <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                <li><a href="admin/admin_login.jsp"><i class="fas fa-user-shield"></i> Admin Login</a></li>
            </ul>
        </div>

        <main class="content">
            <h1><i class="fas fa-smile-beam"></i> Welcome to MyRestaurant</h1>
            <p>Enjoy delicious food and fast delivery from your favorite restaurant!</p>
        </main>
        
    </div>

    <footer>
        &copy; 2025 MyRestaurant. All rights reserved.
    </footer>

</body>
</html>
