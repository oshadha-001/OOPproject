<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="stylesheet.css">
    <link href="CSS/stylesheet.css" rel='stylesheet'>
</head>
<body>

<video autoplay muted loop id="video-background">
    <source src=resources/videos/backgroundvideo.mp4>
</video>


<!-- Login Form -->
<div class="wrapper">
    <form onsubmit="return validateUserLogin()">
        <h1>Vendor Login</h1>

        <div class="input-box">
            <input type="text" name="username" placeholder="Enter Username" required>
            <i class='bx bxs-user'></i>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Enter Password" required>
            <i class='bx bxs-lock-alt'></i>
        </div>

        <div class="remember-forgot">
            <input type="checkbox" id="remember-me" name="remember-me">
            <label for="remember-me">Remember me</label>
            <a href="forgot_password.jsp">Forgot password?</a>
        </div>

        <button type="submit" class="btn" onclick="window.location.href='VendorBookingMenu.jsp'">Login</button>


        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Vendor Register</a></p>
        </div>
    </form>
</div>

<!-- Admin Login Button -->
<button class="admin_btn" onclick="validateAdminLogin()">
    Admin <i class='bx bx-right-arrow bx-flashing'></i>
</button>

<!-- JavaScript for Login Validation -->
<script>
    function validateUserLogin() {
        const username = document.querySelector('input[name="username"]').value;
        const password = document.querySelector('input[name="password"]').value;

        // Get stored users from localStorage
        const users = JSON.parse(localStorage.getItem("users")) || [];

        // Find user with matching username and password
        const matchedUser = users.find(user => user.username === username && user.password === password);

        if (!matchedUser) {
            alert("Invalid Username or Password!");
            return false;
        }

        // Store logged-in user info in sessionStorage
        sessionStorage.setItem("loggedInUser", JSON.stringify(matchedUser));

        alert("Login successful!");
        window.location.href = "../FrontPage/firstpage.html?username=" + encodeURIComponent(username);
        return false; // Prevent form submission
    }

    function validateAdminLogin() {
        const adminUsername = prompt("Enter Admin Username:");
        const adminPassword = prompt("Enter Admin Password:");

        if (adminUsername === "oshadha" && adminPassword === "123") {
            window.location.href = "Admin.jsp";
        } else {
            alert("Invalid Admin Credentials!");
        }
    }
</script>

</body>
</html>
