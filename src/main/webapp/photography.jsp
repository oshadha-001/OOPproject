<%--
  Created by IntelliJ IDEA.
  User: IT24103931
  Date: 5/17/2025
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Photography Vendors</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fffaf5;
            margin: 0;
            padding: 0;
        }

        header {
            padding: 20px;
            background-color: #b45f06;
            color: white;
            text-align: center;
        }

        .sort-btn-container {
            text-align: right;
            padding: 20px 30px 0;
        }

        .sort-btn {
            padding: 10px 20px;
            background-color: #f7d59c;
            color: #b45f06;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .vendor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 30px;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #b45f06;
            margin-bottom: 8px;
        }

        .card-price {
            color: #444;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .card-desc {
            font-size: 0.95rem;
            color: #666;
        }
    </style>
</head>
<body>

<header>
    <h1>Photography Services</h1>
</header>

<div class="sort-btn-container">
    <button class="sort-btn" onclick="sortByPrice()">Sort by Price</button>
</div>

<div class="vendor-grid" id="vendorGrid">
    <div class="card" data-price="800">
        <img src="images/photo1.jpg" alt="Wedding Photography 1">
        <div class="card-body">
            <div class="card-title">Elegant Frames</div>
            <div class="card-price">$800</div>
            <div class="card-desc">Capture your moments with timeless elegance and style.</div>
        </div>
    </div>

    <div class="card" data-price="1200">
        <img src="images/photo2.jpg" alt="Wedding Photography 2">
        <div class="card-body">
            <div class="card-title">Golden Hour Studio</div>
            <div class="card-price">$1200</div>
            <div class="card-desc">Professional wedding photography with cinematic flair.</div>
        </div>
    </div>

    <div class="card" data-price="950">
        <img src="images/photo3.jpg" alt="Wedding Photography 3">
        <div class="card-body">
            <div class="card-title">Lens & Love</div>
            <div class="card-price">$950</div>
            <div class="card-desc">Beautiful storytelling through the lens of love.</div>
        </div>
    </div>
</div>

<script>
    function sortByPrice() {
        const grid = document.getElementById("vendorGrid");
        const cards = Array.from(grid.children);

        cards.sort((a, b) => {
            const priceA = parseInt(a.getAttribute("data-price"));
            const priceB = parseInt(b.getAttribute("data-price"));
            return priceA - priceB;
        });

        grid.innerHTML = "";
        cards.forEach(card => grid.appendChild(card));
    }
</script>

</body>
</html>

