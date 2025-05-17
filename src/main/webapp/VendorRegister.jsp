<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Wedding Vendor Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #9f7d7d;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        title {
            text-align: center;
            color: #d63384;
            font-size: 2em;
            margin-bottom: 20px;
        }

        .centered-container {
            background-color: #ffffff;
            padding: 60px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .login-box img.logo {
            width: 100px;
            display: block;
            margin: 0 auto 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
            color: #d63384;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .strength {
            font-size: 0.85em;
            margin-top: 5px;
        }

        .weak {
            color: red;
        }

        .medium {
            color: orange;
        }

        .strong {
            color: green;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #ef99e0;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #d63384;
        }

        .go-back-btn,
        .login-btn {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #d63384;
            font-weight: bold;
        }

        .go-back-btn:hover,
        .login-btn:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            margin-bottom: 15px;
            font-size: 0.9em;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="centered-container">
    <form class="login-box" action="vendor-register" method="post">
        <img src="pics/qwe.png" alt="Wedding Logo" class="logo"/>
        <h2>Vendor Registration</h2>

        <!-- Display error message if registration fails -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <p class="error-message">
            <%= error %>
        </p>
        <%
            }
        %>

        <div class="form-group">
            <label for="vendorName">Vendor Name</label>
            <input type="text" id="vendorName" name="vendorName" required/>
        </div>

        <div class="form-group">
            <label for="vendorId">Vendor ID</label>
            <input type="text" id="vendorId" name="vendorId" required
                   pattern="[A-Za-z0-9]{5,}" title="Minimum 5 characters. Letters and numbers only."/>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required oninput="checkPasswordStrength()"/>
            <div id="strengthMessage" class="strength"></div>
        </div>

        <button type="submit" class="btn">Register</button>
    </form>

    <a href="vendorLogin.jsp" class="login-btn">Already registered? Login</a>
    <a href="index.jsp" class="go-back-btn">Back to Home</a>
</div>

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
</script>
</body>
</html>
