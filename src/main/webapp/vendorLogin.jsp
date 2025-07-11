<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Wedding Vendor Login</title>
    <link rel="stylesheet" href="CSS/login.css"/>
    <link rel="stylesheet" href="CSS/bootstrap.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<main class="centered-container logo-background">
    <%-- Optional Logo Image --%>
    <img src="pics/qwe.png" alt="Wedding Logo" class="logo"/>

    <form class="login-box" action="vendor" method="post" autocomplete="off">
        <h2>Vendor Login</h2>

        <!-- Display error message if login fails -->
        <%
            String error = (String) request.getAttribute("error");
            boolean hasError = error != null;
        %>
        <% if (hasError) { %>
        <p class="error-message">
            <i class="fas fa-exclamation-triangle"></i> <%= error %>
        </p>
        <% } %>

        <!-- Vendor ID -->
        <div class="form-group">
            <label for="vendorId">Vendor ID</label>
            <input type="text" id="vendorId" name="vendorId" required
                   class="<%= hasError ? "input-error" : "" %>"/>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required
                   class="<%= hasError ? "input-error" : "" %>"/>
        </div>

        <!-- Action Buttons -->
        <button type="submit" class="btn btn-primary">Login</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='VendorRegister.jsp'">Register</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='Admin.jsp'">Admin</button>
    </form>
        <!-- Back to Home Button -->

        <div style="text-align: center; margin-top: 20px;">
            <a href="index.jsp" class="btn btn-danger">
                <i class="fas fa-arrow-left"></i> Logout
            </a>
        </div>

</main>


<script src="JSP/login.js"></script>

</body>
</html>
