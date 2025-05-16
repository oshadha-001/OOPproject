<%--
  Created by IntelliJ IDEA.
  User: Nadula Disanayaka
  Date: 5/16/2025
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>

<form action="create-product" method="post">

  <input type="text" class="form-control" name="productID" placeholder="Enter product id" required />

  <input type="text" name="productName" placeholder="Enter product Name" required />
  <button type="submit"> Done</button>

</form>

</body>
</html>
