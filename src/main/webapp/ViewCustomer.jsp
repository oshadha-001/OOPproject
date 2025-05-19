<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/13/2025
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, CustomerManagement.Customer" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Details | Admin Panel</title>
  <link rel="stylesheet" href="CSS/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body>
<div class="container mt-5">
  <h3 class="mb-4">Customer Details</h3>

  <!-- Email Search Input -->
<%--  <div class="mb-3">--%>
<%--    <input type="text" class="form-control" placeholder="Search customer by email...">--%>
<%--  </div>--%>


  <% if (request.getAttribute("message") != null) { %>
  <div class="alert alert-success"><%= request.getAttribute("message") %></div>
  <% } else if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
  <% } %>

  <!-- Customer Table -->
  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr>
      <th>#</th>
      <th>Customer Name</th>
      <th>Email</th>
      <th>Mobile</th>
      <th>Address</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      // Replace with actual retrieval of customer list
      List<Customer> customerList = (List<Customer>) request.getAttribute("customerList");
      if (customerList != null) {
        int index = 1;
        for (Customer c : customerList) {
    %>
    <tr>
      <td><%= index++ %></td>
      <td><%= c.getFirstName()%></td>
      <td><%= c.getEmail() %></td>
      <td><%= c.getMobile() %></td>
      <td><%= c.getAddress() %></td>
      <td>
        <form action="RemoveCustomerServlet" method="post" style="display:inline;">
          <input type="hidden" name="email" value="<%= c.getEmail() %>">
          <button class="btn btn-danger btn-sm" type="submit">
            <i class="bi bi-trash"></i> Remove
          </button>
        </form>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="7" class="text-center">No customer data found.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>
</body>

</html>

