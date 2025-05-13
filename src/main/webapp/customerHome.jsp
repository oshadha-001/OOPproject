<%--
  Created by IntelliJ IDEA.
  User: NewGen
  Date: 5/11/2025
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="CustomerManagement.Customer" %>
<%@ page session="true" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("customerSignIn.jsp?error=Please+log+in+first");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Home</title>
</head>
<body>
<h1>Welcome, <%= customer.getFirstName() %>!</h1>
<a href="LogoutServlet">Logout</a>

<p><a href="profile.jsp">Customer profile</a></p>
<p><a href="ViewCustomer.jsp">view customers</a></p>

</body>
</html>


