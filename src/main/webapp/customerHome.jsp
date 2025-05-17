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
    <meta charset="UTF-8">
    <title>Customer Home - Wedding Bliss</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #fff8f0;
        }

        header {
            background-color: #f76c6c;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
            font-size: 28px;
        }

        nav {
            background-color: #ffa69e;
            display: flex;
            justify-content: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .content {
            padding: 30px;
            text-align: center;
        }

        .content a.button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #f76c6c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .content a.button:hover {
            background-color: #e75b5b;
        }
    </style>
</head>
<body>
<header>
    <h1>Wedding Bliss - Vendor Booking System</h1>
    <div>
        Welcome, <%= customer.getFirstName() %>!
        | <a href="LogoutServlet" style="color:white; text-decoration:underline;">Logout</a>
    </div>
</header>

<nav>
    <a href="decorators.jsp">Decorators</a>
    <a href="caterers.jsp">Caterers</a>
    <a href="venues.jsp">Venues</a>
    <a href="photography.jsp">Photographers</a>
    <a href="entertainers.jsp">Entertainers</a>
</nav>

<div class="content">
    <h2>Welcome to your Dashboard</h2>
    <a class="button" href="profile.jsp">View/Edit Profile</a>
    <a class="button" href="ViewCustomer.jsp">View All Customers</a>
</div>
</body>
</html>



