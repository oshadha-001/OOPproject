<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wedding Vendor Registration</title>
    <link rel="stylesheet" href="CSS/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        .strength {
            font-size: 0.8em;
            margin-top: 4px;
            margin-left: 2px;
        }
        .weak { color: red; }
        .medium { color: orange; }
        .strong { color: green; }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="centered-container">
    <form class="login-box" action="vendor-register" method="post">
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
            <input type="text" id="vendorId" name="vendorId" required
                   pattern="[A-Za-z0-9]{5,}" title="Minimum 5 characters. Letters and numbers only." />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required oninput="checkPasswordStrength()" />
            <div id="strengthMessage" class="strength"></div>
        </div>

        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>

<a href="index.jsp" class="go-back-btn">
    <i class="fas fa-arrow-left"></i> Back to Home
</a>

<script>
    function checkPasswordStrength() {
        const password = document.getElementById("password").value;
        const strengthMessage = document.getElementById("strengthMessage");

        let strength = 0;

        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
        if (/\d/.test(password)) strength++;
        if (/[@$!%*?&]/.test(password)) strength++;

        if (password.length === 0) {
            strengthMessage.textContent = "";
            strengthMessage.className = "strength";
        } else if (strength <= 1) {
            strengthMessage.textContent = "Weak (min 8 characters, include upper & lower case, number, symbol)";
            strengthMessage.className = "strength weak";
        } else if (strength === 2 || strength === 3) {
            strengthMessage.textContent = "Medium";
            strengthMessage.className = "strength medium";
        } else {
            strengthMessage.textContent = "Strong";
            strengthMessage.className = "strength strong";
        }
    }

    <button type="button" className="btn btn-secondary" onClick="location.href='vendorLogin.jsp'">Login</button>
</script>
</body>
</html>
