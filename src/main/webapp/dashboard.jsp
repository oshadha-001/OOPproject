<%--
  Created by IntelliJ IDEA.
  User: H.M.Oshadha
  Date: 5/21/2025
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Vendor Dashboard</title>
    <link rel="stylesheet" href="CSS/bootstrap.css"/>
</head>
<body>
<div class="container">
    <h2>Welcome, <%= session.getAttribute("vendorId") %>!</h2>
    <p>This is your vendor dashboard.</p>
    <a href="index.jsp" class="btn btn-danger">Logout</a>
</div>
</body>
</html>