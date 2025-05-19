<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Add Product</title>
  <link rel="stylesheet" href="CSS/WeddingItem.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<header class="py-3">
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand fw-bold text-primary" href="#">Wedding Vendor Attire Store</a>
    </div>
  </nav>
</header>

<div class="container mt-5">
  <div class="card shadow-sm">
    <div class="card-body">
      <h4 class="card-title mb-4">Add New Item</h4>
      <form method="post" action="addProduct">
        <div class="mb-3">
          <input type="text" class="form-control mb-2" name="vendor" placeholder="Vendor Name" required>
          <input type="text" class="form-control mb-2" name="name" placeholder="Item Name" required>
          <input type="number" class="form-control mb-2" name="price" placeholder="Price" min="0" required>
          <input type="url" class="form-control mb-2" name="image" placeholder="Image URL" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Item</button>
      </form>

      <%
        String msg = (String) request.getAttribute("message");
        if (msg != null && !msg.isEmpty()) {
      %>
      <div class="alert alert-success mt-4">
        <%= msg %>
      </div>
      <% } %>
    </div>
  </div>
</div>
</body>
</html>
