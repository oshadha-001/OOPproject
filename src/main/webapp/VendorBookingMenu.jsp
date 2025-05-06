<%--
  Created by IntelliJ IDEA.
  User: H.M.Oshadha
  Date: 5/6/2025
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Wedding Vendor Booking</title>
    <link rel="stylesheet" href="CSS/VendorBookingMenu.css"/>
</head>
<body>

<header>
    <h1>Wedding Vendor Booking System</h1>
</header>

<div class="container">
    <div class="vendor-grid">
        <!-- Photographer -->
        <div class="vendor-card">
            <img src="resources/images/PhotoG.avif" alt="Photographer"/>
            <div class="info">
                <h3>Photography</h3>
                <p>Capture your special moments with top-rated photographers.</p>
                <button>Book Now</button>
            </div>
        </div>

        <!-- Wedding Hall -->
        <div class="vendor-card">
            <img src="resources/images/Hall.jpeg" alt="Wedding Hall"/>
            <div class="info">
                <h3>Wedding Hall</h3>
                <p>Choose from elegant venues to match your style and budget.</p>
                <button>Book Now</button>
            </div>
        </div>

        <!-- Catering -->
        <div class="vendor-card">
            <img src="resources/images/Catering.avif" alt="Catering"/>
            <div class="info">
                <h3>Catering</h3>
                <p>Delicious menus for your guests with customizable options.</p>
                <button>Book Now</button>
            </div>
        </div>

        <!-- Dress -->
        <div class="vendor-card">
            <img src="resources/images/Dress.avif" alt="Wedding Dress"/>
            <div class="info">
                <h3>Wedding Dress</h3>
                <p>Find the perfect bridal outfit for your big day.</p>
                <button>Book Now</button>
            </div>
        </div>
    </div>
</div>

<footer>
    © 2025 OTK ~ Wedding Vendor Booking System. All rights reserved.
    (OOP Project - Group 42)
</footer>

</body>
</html>
