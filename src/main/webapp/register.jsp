<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form in HTML and CSS</title>
    <link rel="stylesheet" href="CSS/stylesheet_register.css">
</head>
<body>

<!-- Background Video -->
<video autoplay muted loop id="video-background">
    <source src="resources/videos/backgroundvideo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<!-- Registration Form -->
<div class="wrapper">
    <form id="registerForm" method="POST" action="register">
        <h1>Vendor Register</h1>

        <div class="input-box">
            <input type="text" name="username" placeholder="Enter vendor Username" required>
        </div>

        <div class="input-box">
            <input type="email" name="email" placeholder="Enter Email" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>

        <div class="input-box">
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
        </div>

        <button type="submit" class="btn">Register</button>

        <div class="login-link">
            <p>Already have an account? <a href="VendorSignIn.jsp">Login</a></p>
        </div>
    </form>
</div>
<script src="JSP/script.js"></script>
</body>
</html>
