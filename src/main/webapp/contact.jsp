<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - MyRestaurant</title>
<link rel="stylesheet" href="./CSS1/contact.css">
</head>
<body>
<div class="container">

    <aside class="sidebar">
        <h2>MyRestaurant</h2>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Menu.jsp">Menu</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp" class="active">Contact</a></li>
            <li><a href="login.jsp">Login / Register</a></li>
        </ul>
    </aside>

    <main class="content">
        <section class="contact-hero">
            <h1>Contact Us</h1>
            <p>We’re here to help! Reach out for questions, feedback, or support.</p>
        </section>

        <section class="contact-section">
            <div class="contact-form">
                <h2>Get in Touch</h2>
                <form action="contact_submit.jsp" method="post">
                    <input type="text" name="name" placeholder="Your Name" required>
                    <input type="email" name="email" placeholder="Your Email" required>
                    <input type="text" name="subject" placeholder="Subject" required>
                    <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
                    <button type="submit">Send Message</button>
                </form>
            </div>

            <div class="contact-info">
                <h2>Contact Information</h2>
                <p><b>📍 Address:</b> 123 Food Street, Pune, Maharashtra, India</p>
                <p><b>📞 Phone:</b> +91 98765 43210</p>
                <p><b>✉️ Email:</b> support@myrestaurant.com</p>
                <p><b>🕒 Working Hours:</b> 9:00 AM – 11:00 PM (All Days)</p>
            </div>
        </section>

        <section class="map-section">
            <h2>Find Us Here</h2>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.548676470065!2d73.85674267496464!3d18.560160367180303!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c06bca0d3057%3A0x4db3af8b617e46e8!2sPune%20City!5e0!3m2!1sen!2sin!4v1707320323002"
                width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy">
            </iframe>
        </section>
    </main>

</div>

<footer>
    <p>&copy; 2025 MyRestaurant. All rights reserved.</p>
</footer>

</body>
</html>
