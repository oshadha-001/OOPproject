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
        .submit-btn { background-color: #4CAF50; color: white; padding: 8px 16px; border: none; cursor: pointer; }
        .submit-btn:hover { background-color: #45a049; }
        a.submit-btn { text-decoration: none; display: inline-block; line-height: 32px; }
    </style>
</head>
<body>
<h2 style="text-align: center;">Payment History</h2>

<div style="text-align: center; margin-bottom: 15px;">
    <form action="PaymentHistoryServlet" method="get">
        <input type="hidden" name="sort" value="true">
        <input type="submit" value="Sort by Amount (High to Low)" class="submit-btn">
    </form>
</div>

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
    <a href="PaymentForm.jsp" class="submit-btn">Make Another Payment</a>
</div>
</body>
</html>
