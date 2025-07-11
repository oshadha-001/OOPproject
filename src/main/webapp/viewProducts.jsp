<%@ page import="java.util.*, ProductManagement.model.Product, ProductManagement.model.CrudFileHandler" %>
<%
    String vendorId = request.getParameter("vendorId");
    if (vendorId == null || vendorId.trim().isEmpty()) {
        out.println("<p style='color:red;'>Vendor ID missing!</p>");
        return;
    }
    String filePath = "D:\\New folder (3)\\src\\main\\webapp\\Data\\Product.txt";

    CrudFileHandler crudHandler = new CrudFileHandler(filePath);
    List<Product> products = crudHandler.getProductsByVendor(vendorId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f4f4f4; }
        form { margin: 0; }
        button {
            padding: 5px 10px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #c9302c;
        }

        .back-button {
            margin: 20px auto;
            display: flex;
            justify-content: center;
        }
        .back-button form button {
            background-color: #5bc0de;
        }
        .back-button form button:hover {
            background-color: #31b0d5;
        }
    </style>
</head>
<body>
<h2 style="text-align:center;">Products for Vendor: <%= vendorId %></h2>

<table>
    <tr>
        <th>Product Type</th>
        <th>Price</th>
        <th>Model</th>
        <th>Action</th>
    </tr>
    <% for (Product p : products) { %>
    <tr>
        <td><%= p.getProductType() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getModel() %></td>
        <td>
            <form action="DeleteProductServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this product?');">
                <input type="hidden" name="vendorId" value="<%= p.getVendorId() %>"/>
                <input type="hidden" name="productType" value="<%= p.getProductType() %>"/>
                <input type="hidden" name="price" value="<%= p.getPrice() %>"/>
                <input type="hidden" name="model" value="<%= p.getModel() %>"/>
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>

<div class="back-button">
    <form action="addProduct.jsp" method="get">
        <input type="hidden" name="vendorId" value="<%= vendorId %>"/>
        <button type="submit">Back to Add Product</button>
    </form>
</div>

</body>
</html>
