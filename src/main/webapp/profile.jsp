<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/12/2025
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | eShop</title>

    <link rel="stylesheet" href="CSS/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/style.css" />

</head>

<body>
<div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row w-100 justify-content-center">
        <%-- HEADER PLACEHOLDER --%>
        <%-- Include header.jsp here if available --%>
<%--        <%@ include file="header.jsp" %>--%>

        <div class="col-12 col-md-8 col-lg-6 bg-body rounded shadow p-4">
            <div class="row g-2">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="fw-bold">Profile Settings</h4>
                    </div>

                    <div class="row mt-4">
                        <div class="col-6">
                            <label class="form-label">First Name</label>
                            <input id="fname" type="text" class="form-control" value="John" />
                        </div>

                        <div class="col-6">
                            <label class="form-label">Last Name</label>
                            <input id="lname" type="text" class="form-control" value="Doe" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Mobile</label>
                            <input id="mobile" type="text" class="form-control" value="0123456789" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="pw" value="password123" />
                                <span class="input-group-text bg-primary" onclick="showPassword3();">
                                        <i id="pwi" class="bi bi-eye-slash-fill text-white"></i>
                                    </span>
                            </div>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control" value="email@example.com" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Address Line 01</label>
                            <input type="text" id="line1" class="form-control" value="123 Main St" />
                        </div>

                        <div class="col-12 d-grid mt-3">
                            <button class="btn btn-primary" onclick="updateProfile();">Update My Profile</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- FOOTER PLACEHOLDER --%>
        <%-- Include footer.jsp here if available --%>
<%--        <%@ include file="footer.jsp" %>--%>
    </div>
</div>

<script src="JSP/bootstrap.bundle.js"></script>
<script src="JSP/logIn.js"></script>
</body>

</html>

