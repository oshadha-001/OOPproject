<%--
  Created by IntelliJ IDEA.
  User: IT24103931 - Dissanayake Y.I
  Date: 5/10/2025
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register | eShop</title>
    <link rel="stylesheet" href="CSS/bootstrap.css" />
    <link rel="stylesheet" href="CSS/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
    <style>
        body {
            background: url('resources/images/background-body.svg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>

<body>
<div class="container d-flex vh-100 justify-content-center align-items-center">

    <!-- sign up -->
    <form action="RegisterServlet" method="post">
        <div class="card shadow register-card p-4">
            <div class="card-body">
                <h3 class="text-center mb-4">Create an Account</h3>

                <!-- Display error message if any -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">
                        <strong>Error!</strong> ${errorMessage}
                    </div>
                </c:if>

                <!-- First Name and Last Name input -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="fname" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter first name" required />
                        <div class="invalid-feedback">Please enter your first name.</div>
                    </div>
                    <div class="col-md-6">
                        <label for="lname" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter last name" required />
                        <div class="invalid-feedback">Please enter your last name.</div>
                    </div>
                </div>

                <!-- Email input -->
                <div class="mb-3">
                    <label for="registerEmail" class="form-label fw-bold">Email</label>
                    <input type="email" class="form-control" id="registerEmail" name="email" placeholder="Enter email" required />
                    <div class="invalid-feedback">Please enter a valid email.</div>
                </div>

                <!-- Password input with toggle visibility -->
                <div class="mb-3">
                    <label for="registerPassword" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="registerPassword" name="password" placeholder="Password" required />
                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('registerPassword', this)">
                            <i class="bi bi-eye-slash"></i>
                        </button>
                    </div>
                    <div class="invalid-feedback">Password is required.</div>
                </div>

                <!-- Mobile Number input -->
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile Number</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Enter mobile number" required />
                    <div class="invalid-feedback">Please enter a valid mobile number.</div>
                </div>

                <!-- Address input -->
                <div class="mb-3">
                    <label for="Address" class="form-label fw-bold">Address</label>
                    <input class="form-control" id="Address" name="Address" placeholder="Enter address" required />
                    <div class="invalid-feedback">Please enter a valid address.</div>
                </div>

                <!-- Register and Back buttons -->
                <div class="row g-2">
                    <div class="col-6 d-grid">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                    <div class="col-6 d-grid">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='customerSignIn.jsp'">Back to Login</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- sign up -->
</div>

<!-- JavaScript for toggling password visibility -->
<script src="JSP/bootstrap.bundle.js"></script>
<script src="JSP/logIn.js"></script>
<script>
    function togglePassword(id, button) {
        const input = document.getElementById(id);
        const icon = button.querySelector('i');
        if (input.type === "password") {
            input.type = "text";
            icon.classList.remove('bi-eye-slash');
            icon.classList.add('bi-eye');
        } else {
            input.type = "password";
            icon.classList.remove('bi-eye');
            icon.classList.add('bi-eye-slash');
        }
    }
</script>

</body>

</html>
