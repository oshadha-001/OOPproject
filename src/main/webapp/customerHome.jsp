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
<html>
<head>
    <title>Customer Dashboard - Wedding Bliss</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fefefe;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #d63384;
            color: white;
            padding: 20px;
            text-align: center;
        }
        nav {
            background-color: #f8f9fa;
            padding: 12px;
            text-align: center;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #d63384;
            font-weight: bold;
        }
        main {
            padding: 20px;
            text-align: center;
        }
        .button {
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            background-color: #d63384;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #b02a6e;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to Wedding Bliss, <%= customer.getFirstName() %>!</h1>
</header>

<nav>
    <a href="profile.jsp">My Profile</a>
    <a href="ViewCustomerServlet">Manage Customers</a>
    <a href="LogoutServlet">Logout</a>
</nav>

<main>
    <h2>Explore Wedding Services</h2>
    <a href="decorators.jsp" class="button">Decorators</a>
    <a href="caterers.jsp" class="button">Caterers</a>
    <a href="venues.jsp" class="button">Venues</a>
    <a href="photographers.jsp" class="button">Photographers</a>
    <a href="entertainers.jsp" class="button">Entertainers</a>
</main>

</body>
</html>
