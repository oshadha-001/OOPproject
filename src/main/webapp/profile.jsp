<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/12/2025
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="CustomerManagement.Customer" %>
<%@ page import="CustomerManagement.CustomerCRUD" %>
<%@ page session="true" %>
<%@ page import="java.io.*" %>

<%
    Customer customer = (Customer) session.getAttribute("customer");

    if (customer == null) {
        response.sendRedirect("customerSignIn.jsp?error=Please+log+in+first");
        return;
    }

    // Reload customer data from file to ensure latest info
    String filePath = application.getRealPath("Data/customers.txt");
    CustomerCRUD crud = new CustomerCRUD(filePath);
    Customer updatedCustomer = crud.findCustomerByEmail(customer.getEmail());

    if (updatedCustomer == null) {
        response.sendRedirect("customerSignIn.jsp?error=Session+expired+or+invalid+customer");
        return;
    }

    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile | eShop</title>
    <link rel="stylesheet" href="CSS/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="CSS/style.css" />
</head>

<body>
<div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center">
    <div class="row w-100 justify-content-center">
        <div class="col-12 col-md-8 col-lg-6 bg-body rounded shadow p-4">
            <div class="row g-2">
                <div class="col-12 d-flex justify-content-between align-items-center mb-3">
                    <h4 class="fw-bold">Profile Settings</h4>
                    <a href="customerHome.jsp" class="btn btn-outline-primary">
                        <i class="bi bi-house-fill"></i> Back to Home
                    </a>
                </div>

                <% if (message != null) { %>
                <div class="alert alert-info"><%= message %></div>
                <% } %>

                <form action="UpdateProfileServlet" method="post">
                    <div class="row mt-4">
                        <div class="col-6">
                            <label class="form-label">First Name</label>
                            <input id="fname" name="fname" type="text" class="form-control" value="<%= updatedCustomer.getFirstName() %>" />
                        </div>

                        <div class="col-6">
                            <label class="form-label">Last Name</label>
                            <input id="lname" name="lname" type="text" class="form-control" value="<%= updatedCustomer.getLastName() %>" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Mobile</label>
                            <input id="mobile" name="mobile" type="text" class="form-control" value="<%= updatedCustomer.getMobile() %>" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="pw" name="pw" value="<%= updatedCustomer.getPassword() %>" />
                                <span class="input-group-text bg-primary" onclick="showPassword3();">
                                    <i id="pwi" class="bi bi-eye-slash-fill text-white"></i>
                                </span>
                            </div>
                        </div>

                        <div class="col-12">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control" value="<%= updatedCustomer.getEmail() %>" readonly />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Address Line 01</label>
                            <input type="text" id="line1" name="line1" class="form-control" value="<%= updatedCustomer.getAddress() %>" />
                        </div>

                        <div class="col-12 d-grid mt-3">
                            <button type="submit" class="btn btn-primary">Update My Profile</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script src="JSP/bootstrap.bundle.js"></script>
<script src="JSP/logIn.js"></script>
</body>
</html>
