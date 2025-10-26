<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - MyRestaurant</title>
<link rel="stylesheet" href="./CSS1/about.css">
</head>
<body>
<div class="container">

    <aside class="sidebar">
        <h2>MyRestaurant</h2>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Menu.jsp">Menu</a></li>
            <li><a href="about.jsp" class="active">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="login.jsp">Login / Register</a></li>
        </ul>
    </aside>

    <main class="content">
        <section class="hero">
            <div class="hero-text">
                <h1>About MyRestaurant</h1>
                <p>Delivering delicious food quickly, right to your doorstep.</p>
            </div>
            <div class="hero-img">
                <img src="./images/restaurant_about.jpeg" alt="Restaurant">
            </div>
        </section>

        <section class="story">
            <h2>Our Story</h2>
            <p>
                MyRestaurant started with a simple mission: bring freshly cooked, high-quality meals to people
                in a fast and convenient way. Our chefs use the finest ingredients to create dishes that satisfy
                every craving.
            </p>
        </section>

        <section class="mission">
            <div class="mission-item">
                <img src="./images/fresh_food.jpeg" alt="Fresh Food">
                <h3>Fresh Ingredients</h3>
                <p>We source our ingredients locally to ensure freshness and quality in every bite.</p>
            </div>
            <div class="mission-item">
                <img src="./images/fast_delivery.jpeg" alt="Fast Delivery">
                <h3>Fast Delivery</h3>
                <p>Our efficient delivery ensures your food arrives hot and on time, every time.</p>
            </div>
            <div class="mission-item">
                <img src="./images/customer_care.jpeg" alt="Customer Care">
                <h3>Customer Care</h3>
                <p>Your satisfaction is our priority. We’re here to serve you with a smile.</p>
            </div>
        </section>

    </main>

</div>

<footer>
    <p>&copy; 2025 MyRestaurant. All rights reserved.</p>
</footer>

</body>
</html>