<%--
  Created by IntelliJ IDEA.
  User: IT24103931 Dissanayake Y.I
  Date: 5/10/2025
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String savedEmail = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("rememberEmail".equals(cookie.getName())) {
                savedEmail = cookie.getValue();
                break;
            }
        }
    }
%>
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
    <div class="card shadow login-card p-4" id="signInBox">
        <div class="card-body">
            <h3 class="text-center mb-4">Welcome Back</h3>

            <!-- Login Form -->
            <form action="SignInServlet" method="post" novalidate>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
                <% } %>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email</label>
                    <input type="email" class="form-control" id="email" name="email"
                           value="<%= savedEmail %>" placeholder="Enter email" required />
                    <div class="invalid-feedback">Please enter your email.</div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                            <i class="bi bi-eye-slash"></i>
                        </button>
                    </div>
                    <div class="invalid-feedback">Password is required.</div>
                </div>

                <div class="mb-3 d-flex justify-content-between align-items-center">
                    <div class="form-check mb-0">
                        <input type="checkbox" class="form-check-input" id="rememberMe" name="remember"
                                <%= savedEmail.isEmpty() ? "" : "checked" %> />
                        <label class="form-check-label" for="rememberMe">Remember Me</label>
                    </div>
                    <a href="#" class="text-decoration-none">Forgot password?</a>
                </div>

                <div class="row g-2">
                    <div class="col-6 d-grid">
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </div>
                    <div class="col-6 d-grid">
                        <a href="customerRegistration.jsp" class="btn btn-secondary">Sign Up</a>
                    </div>
                    <div class="col-12 d-grid">
                        <a href="adminLogin.jsp" class="btn btn-dark">Admin Login</a>
                    </div>
                </div>
            </form>
            <!-- End Login Form -->
        </div>
    </div>
</div>

<script src="JSP/bootstrap.bundle.js"></script>
<script src="JSP/logIn.js"></script>
</body>
</html>
