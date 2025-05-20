<%@ page import="com.weddingplanner.model.Payment, java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment History</title>
    <style>
        table { width: 80%; border-collapse: collapse; margin: auto; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        .delete-btn { background-color: #e74c3c; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .delete-btn:hover { background-color: #c0392b; }
    </style>
</head>
<body>
<h2 style="text-align: center;">Payment History</h2>
<table>
    <tr>
        <th>Customer Name</th>
        <th>Amount</th>
        <th>Payment Method</th>
        <th>Action</th>
    </tr>
    <%
        List<Payment> payments = (List<Payment>) request.getAttribute("payments");
        for (int i = 0; i < payments.size(); i++) {
            Payment p = payments.get(i);
    %>
    <tr>
        <td><%= p.getCustomerName() %></td>
        <td>$<%= p.getAmount() %></td>
        <td><%= p.getPaymentMethod() %></td>
        <td>
            <form method="post" action="DeletePaymentServlet">
                <input type="hidden" name="index" value="<%= i %>">
                <input type="submit" value="Delete" class="delete-btn">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<br>
<div style="text-align:center;">
    <a href="PaymentForm.jsp">Make Another Payment</a>
</div>
</body>
</html>
