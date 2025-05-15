<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Wedding Vendor Login</title>
  <link rel="stylesheet" href="CSS/login.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<main class="centered-container">
  <form class="login-box" action="vendorLogin" method="post" autocomplete="off">
    <img src="pics/313-3137800_wedding-event-logo-design.png" alt="Wedding Logo" class="logo" />
    <h2>Vendor Login</h2>

    <!-- Display error message if login fails -->
    <%
      String error = (String) request.getAttribute("error");
      boolean hasError = error != null;
    %>
    <% if (hasError) { %>
    <p class="error-message">
      <i class="fas fa-exclamation-triangle"></i> <%= error %>
    </p>
    <% } %>

    <div class="form-group">
      <label for="vendorId">Vendor ID</label>
      <input type="text" id="vendorId" name="vendorId" required aria-required="true" aria-label="Vendor ID" class="<%= hasError ? "input-error" : "" %>" />
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required aria-required="true" aria-label="Password" class="<%= hasError ? "input-error" : "" %>" />
    </div>

    <button type="submit" class="btn btn-primary">Login</button>
    <button type="button" class="btn btn-secondary" onclick="location.href='VendorRegister.jsp'">Register</button>
  </form>
</main>

<button class="go-back-btn" onclick="location.href='index.jsp'">
  <i class="fas fa-arrow-left"></i> Back to Home
</button>
</body>
</html>
