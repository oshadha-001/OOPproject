<%--
  Created by IntelliJ IDEA.
  User: H.M.Oshadha
  Date: 5/6/2025
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
        <div class="vendor-card" id="photography-card">
            <img src="resources/images/PhotoG.avif" alt="Photographer"/>
            <div class="info">
                <h3>Photography</h3>
                <p>Capture your special moments with top-rated photographers.</p>
                <button onclick="toggleDetails('photography-card', this)">Show More</button>
                <div class="extra-details">
                    <ul>
                        <li>Basic: Ceremony only</li>
                        <li>Standard: Ceremony + Reception</li>
                        <li>Premium: Full Day + Album</li>
                    </ul>
                    <button class="book-btn" onclick="window.location.href='WenderTable.jsp'">Book Now</button>
                </div>
            </div>
        </div>

        <!-- Wedding Hall -->
        <div class="vendor-card" id="hall-card">
            <img src="resources/images/Hall.jpeg" alt="Wedding Hall"/>
            <div class="info">
                <h3>Wedding Hall</h3>
                <p>Choose from elegant venues to match your style and budget.</p>
                <button onclick="toggleDetails('hall-card', this)">Show More</button>
                <div class="extra-details">
                    <ul>
                        <li>Classic Ballroom</li>
                        <li>Outdoor Garden</li>
                        <li>Luxury Banquet</li>
                    </ul>
                    <button class="book-btn" onclick="window.location.href='WenderTable.jsp'">Book Now</button>
                </div>
            </div>
        </div>

        <!-- Catering -->
        <div class="vendor-card" id="catering-card">
            <img src="resources/images/Catering.avif" alt="Catering"/>
            <div class="info">
                <h3>Catering</h3>
                <p>Delicious menus for your guests with customizable options.</p>
                <button onclick="toggleDetails('catering-card', this)">Show More</button>
                <div class="extra-details">
                    <ul>
                        <li>Buffet</li>
                        <li>Plated Service</li>
                        <li>Live Stations</li>
                    </ul>
                    <button class="book-btn" onclick="window.location.href='WenderTable.jsp'">Book Now</button>
                </div>
            </div>
        </div>

        <!-- Wedding Dress -->
        <div class="vendor-card" id="dress-card">
            <img src="resources/images/Dress.avif" alt="Wedding Dress"/>
            <div class="info">
                <h3>Wedding Dress</h3>
                <p>Find the perfect bridal outfit for your big day.</p>
                <button onclick="toggleDetails('dress-card', this)">Show More</button>
                <div class="extra-details">
                    <ul>
                        <li>Ball Gown</li>
                        <li>Mermaid</li>
                        <li>A-Line</li>
                    </ul>
                    <button class="book-btn" onclick="window.location.href='WenderTable.jsp'">Book Now</button>
                </div>
            </div>
        </div>

    </div>
</div>

<footer>
    © 2025 OTK ~ Wedding Vendor Booking System. All rights reserved.
    (OOP Project - Group 42)
</footer>

<script>
    function toggleDetails(cardId, buttonElement) {
        const card = document.getElementById(cardId);
        const isExpanded = card.classList.toggle('expanded');
        if (isExpanded) {
            buttonElement.style.display = 'none';
        } else {
            buttonElement.style.display = 'inline-block';
        }
    }
</script>

</body>
</html>
