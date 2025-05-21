<%@ page import="java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Product</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      margin: 20px;
    }
    .container {
      width: 50%;
      margin: auto;
      background: white;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 10px;
    }
    h2 {
      text-align: center;
      color: #333;
    }
    label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
    }
    input[type="text"], input[type="number"], select {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      margin-top: 20px;
      width: 100%;
      padding: 10px;
      background-color: #007BFF;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
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
    out.println("<p style='color:red;'>" + e.getMessage() + "</p>");
  }

  String vendorId = request.getParameter("vendorId") != null ? request.getParameter("vendorId") : "";
%>

<div class="container">
  <h2>Add Product</h2>
  <form action="AddProductServlet" method="post">
    <label for="vendorId">Vendor ID:</label>
    <input type="text" name="vendorId" id="vendorId" required value="<%= vendorId %>">

    <label for="productType">Product Type:</label>
    <select name="productType" id="productType" required>
      <% for (Map.Entry<String, String> entry : productTypes.entrySet()) { %>
      <option value="<%= entry.getValue() %>"><%= entry.getValue() %></option>
      <% } %>
    </select>

    <label for="price">Price:</label>
    <input type="number" name="price" id="price" step="0.01" required>

    <label for="model">Model:</label>
    <input type="text" name="model" id="model" required>

    <button type="submit">Add Product</button>
  </form>
</div>
</body>
</html>
