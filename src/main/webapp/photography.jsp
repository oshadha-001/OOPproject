<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/16/2025
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Photographers - Wedding Bliss</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #3f51b5;
            margin-bottom: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 30px;
        }

        .sort-button {
            background-color: #3f51b5;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .sort-button:hover {
            background-color: #2c387e;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background: white;
            width: 300px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 20px;
        }

        .card h3 {
            margin: 0;
            color: #3f51b5;
        }

        .card p {
            margin: 10px 0;
            color: #555;
        }

        .price {
            font-weight: bold;
            color: #e91e63;
        }

        .book-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #e91e63;
            color: white;
            text-align: center;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .book-btn:hover {
            background-color: #c2185b;
        }
    </style>
</head>
<body>

<h1>Photographers</h1>

<div class="top-bar">
    <button class="sort-button">Sort by Price</button>
</div>

<div class="card-container">
    <div class="card">
        <img src="images/photographer1.jpg" alt="Elegant Studio">
        <div class="card-body">
            <h3>Elegant Studio</h3>
            <p>Premium wedding shoots and cinematography.</p>
            <p class="price">Price: $800</p>
            <button class="book-btn">Book Now</button>
        </div>
    </div>

    <div class="card">
        <img src="images/photographer2.jpg" alt="Snap & Frame">
        <div class="card-body">
            <h3>Snap & Frame</h3>
            <p>Natural light photography with a modern touch.</p>
            <p class="price">Price: $600</p>
            <button class="book-btn">Book Now</button>
        </div>
    </div>

    <div class="card">
        <img src="images/photographer3.jpg" alt="Lens Masters">
        <div class="card-body">
            <h3>Lens Masters</h3>
            <p>Creative cinematic wedding coverage.</p>
            <p class="price">Price: $950</p>
            <button class="book-btn">Book Now</button>
        </div>
    </div>
</div>

</body>
</html>
