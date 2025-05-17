<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/11/2025
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="CustomerManagement.Customer" %>
<%@ page session="true" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("customerSignIn.jsp?error=Please+log+in+first");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Wedding Planner - Home</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fdf6f0;
            color: #444;
            min-height: 100vh;
        }

        /* Navbar */
        nav {
            background: #b45f06;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(180, 95, 6, 0.7);
        }

        nav .logo {
            font-size: 1.8rem;
            color: #fff;
            font-weight: 700;
            letter-spacing: 2px;
            font-family: 'Brush Script MT', cursive;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 25px;
        }

        nav ul li {
            transition: background-color 0.3s ease;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            padding: 8px 15px;
            border-radius: 4px;
        }

        nav ul li a:hover {
            background: #f7d59c;
            color: #b45f06;
        }

        nav .user-area {
            color: #fff;
            font-weight: 600;
        }

        nav .logout-btn {
            background: #f7d59c;
            color: #b45f06;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            margin-left: 20px;
            text-decoration: none;
        }

        nav .logout-btn:hover {
            background: #d9b86e;
        }

        /* Main content */
        main {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
            text-align: center;
        }

        main h1 {
            font-family: 'Brush Script MT', cursive;
            font-size: 3rem;
            color: #b45f06;
            margin-bottom: 10px;
        }

        main p.subtitle {
            font-size: 1.2rem;
            color: #777;
            margin-bottom: 40px;
        }

        .vendor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(220px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .vendor-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(180, 95, 6, 0.15);
            padding: 20px;
            transition: transform 0.3s ease;
            cursor: pointer;
            color: #b45f06;
            font-weight: 700;
            font-size: 1.3rem;
        }

        .vendor-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(180, 95, 6, 0.3);
            background-color: #f7d59c;
            color: #6a3c00;
        }

        /* Footer */
        footer {
            background: #b45f06;
            color: #fff;
            padding: 20px 30px;
            text-align: center;
            font-weight: 600;
            letter-spacing: 1.5px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        @media (max-width: 480px) {
            nav ul {
                flex-direction: column;
                gap: 10px;
            }
            main h1 {
                font-size: 2.2rem;
            }
        }
    </style>
</head>
<body>
<nav>
    <div class="logo">Wedding Bliss</div>
    <ul>
        <li><a href="photography.jsp">Photography</a></li>
        <li><a href="catering.jsp">Catering</a></li>
        <li><a href="weddinghall.jsp">Wedding Halls</a></li>
        <li><a href="weddingdress.jsp">Wedding Dresses</a></li>
        <li><a href="profile.jsp">Profile</a></li>
    </ul>
    <div class="user-area">
        Welcome, <%= customer.getFirstName() %>!
        <a href="LogoutServlet" class="logout-btn">Logout</a>
    </div>
</nav>

<main>
    <h1>Your Dream Wedding Starts Here</h1>
    <p class="subtitle">Plan, book, and celebrate with the best vendors all in one place.</p>

    <div class="vendor-grid">
        <a href="photography.jsp" class="vendor-card">Photography</a>
        <a href="catering.jsp" class="vendor-card">Catering Services</a>
        <a href="weddinghall.jsp" class="vendor-card">Wedding Halls</a>
        <a href="weddingdress.jsp" class="vendor-card">Wedding Dresses</a>
    </div>

    <p>Explore our wide range of vendors to make your special day unforgettable!</p>
</main>

<footer>
    &copy; 2025 Wedding Bliss. All rights reserved.
</footer>
</body>
</html>
