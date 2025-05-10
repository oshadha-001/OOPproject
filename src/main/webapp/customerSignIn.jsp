<%--
  Created by IntelliJ IDEA.
  User: IT24103931 Dissanayake Y.I
  Date: 5/10/2025
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login | eShop</title>
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
    <!-- signin-box -->
    <div class="card shadow login-card p-4 " id="signInBox">
        <div class="card-body">
            <h3 class="text-center mb-4">Welcome Back</h3>
            <form id="loginForm" novalidate>
                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" required />
                    <div class="invalid-feedback">Please enter your email.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" placeholder="Password" required />
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                            <i class="bi bi-eye-slash"></i>
                        </button>
                    </div>
                    <div class="invalid-feedback">Password is required.</div>
                </div>

                <div class="mb-3 d-flex justify-content-between align-items-center">
                    <div class="form-check mb-0">
                        <input type="checkbox" class="form-check-input" id="rememberMe" />
                        <label class="form-check-label" for="rememberMe">Remember Me</label>
                    </div>
                    <a href="#" class="text-decoration-none" id="forgotPassword">Forgot password?</a>
                </div>

                <div class="row g-2">
                    <div class="col-6 d-grid">
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </div>
                    <div class="col-6 d-grid">
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='CustomerRegistration.jsp'">Sign Up</button>

                    </div>
                    <div class="col-12 d-grid">
                        <button type="button" class="btn btn-dark">Admin Login</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- signin - box -->
</div>

<script src="JSP/bootstrap.bundle.js"></script>
<script src="JSP/logIn.js"></script>
</body>

</html>

