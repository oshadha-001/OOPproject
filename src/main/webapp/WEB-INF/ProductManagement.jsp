<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/20/2025
  Time: 11:21 PM
--%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Product</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: white;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 400px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    form label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #555;
    }

    input[type="text"],
    input[type="number"],
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 10px;
      width: 100%;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Add Product</h2>

  <%
    String path = application.getRealPath("/Data/productType.txt");
    Map<String, String> productTypes = new LinkedHashMap<>();

    try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
      String line;
      while ((line = reader.readLine()) != null) {
        String[] parts = line.split(",", 2);
        if (parts.length == 2) {
          productTypes.put(parts[0].trim(), parts[1].trim());
        }
      }
    } catch (Exception e) {
      out.println("<p style='color:red;'>Error loading product types: " + e.getMessage() + "</p>");
    }
  %>

  <form action="AddProductServlet" method="post">
    <label for="vendorId">Vendor ID:</label>
    <input type="text" id="vendorId" name="vendorId" required>

    <label for="productType">Product Type:</label>
    <select id="productType" name="productType" required>
      <% for (Map.Entry<String, String> entry : productTypes.entrySet()) { %>
      <option value="<%= entry.getValue() %>"><%= entry.getValue() %></option>
      <% } %>
    </select>

    <label for="price">Price:</label>
    <input type="number" step="0.01" id="price" name="price" required>

    <label for="model">Model:</label>
    <input type="text" id="model" name="model" required>

    <input type="submit" value="Add Product">
  </form>
</div>
</body>
</html>
