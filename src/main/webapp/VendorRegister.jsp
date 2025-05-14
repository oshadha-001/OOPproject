<%--
  Created by IntelliJ IDEA.
  User: oshad
  Date: 5/14/2025
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wedding Vendor Registration</title>
    <link rel="stylesheet" href="CSS/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div class="centered-container">
    <form class="login-box" action="vendorRegister" method="post">
        <img src="pics/313-3137800_wedding-event-logo-design.png" alt="Wedding Logo" class="logo" />
        <h2>Vendor Registration</h2>

        <!-- Display error message if registration fails -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <p class="error-message">
            <i class="fas fa-exclamation-triangle"></i> <%= error %>
        </p>
        <%
            }
        %>

        <div class="form-group">
            <label for="vendorName">Vendor Name</label>
            <input type="text" id="vendorName" name="vendorName" required />
        </div>

        <div class="form-group">
            <label for="vendorId">Vendor ID</label>
            <input type="text" id="vendorId" name="vendorId" required />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />
        </div>

        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>

<a href="index.jsp" class="go-back-btn">
    <i class="fas fa-arrow-left"></i> Back to Home
</a>
</body>
</html>