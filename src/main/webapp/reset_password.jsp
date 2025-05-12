<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link rel="stylesheet" href="stylesheet.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <style>
        /* Basic styling for error messages */
        .error-message {
            color: red;
            margin-bottom: 10px;
        }

        .success-message {
            color: green;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<video autoplay muted loop id="video-background">
    <source src="backgroundvideo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<div class="wrapper">
    <form action="ResetPasswordServlet" method="POST" onsubmit="return validateForm()">
        <h1>Reset Password</h1>

        <%-- Display error or success message from servlet --%>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
        <p class="<%= message.contains("success") ? "success-message" : "error-message" %>">
            <%= message %>
        </p>
        <% } %>

        <div class="input-box">
            <input type="text" name="username" placeholder="Enter username" required>
            <i class="bx bxs-user"></i>
        </div>

        <div class="input-box">
            <input type="password" name="newPassword" id="newPassword" placeholder="Enter new password" required>
            <i class="bx bxs-lock-alt"></i>
        </div>

        <div class="input-box">
            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm new password"
                   required>
            <i class="bx bxs-lock-alt"></i>
        </div>

        <button type="submit" class="btn">Reset Password</button>
    </form>
    <p><a href="VendorSignIn.jsp">Back to Sign In</a></p>
</div>

<script>
    function validateForm() {
        const newPassword = document.getElementById("newPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        if (newPassword !== confirmPassword) {
            alert("Passwords do not match!");
            return false;
        }
        return true;
    }
</script>
</body>
</html>