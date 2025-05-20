<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make a Payment</title>
    <style>
        body { font-family: Arial; margin: 50px; }
        .form-container { max-width: 400px; margin: auto; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input, select { width: 100%; padding: 8px; }
        .submit-btn { background-color: #4CAF50; color: white; padding: 10px; border: none; cursor: pointer; }
        .submit-btn:hover { background-color: #45a049; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Make a Payment</h2>
    <form action="PaymentHistoryServlet" method="post">
        <div class="form-group">
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required>
        </div>
        <div class="form-group">
            <label for="amount">Amount ($):</label>
            <input type="number" id="amount" name="amount" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="paymentMethod">Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="Credit Card">Credit Card</option>
                <option value="PayPal">PayPal</option>
                <option value="Cash">Cash</option>
            </select>
        </div>
        <input type="submit" value="Submit Payment" class="submit-btn">
    </form>
    <br>
    <a href="PaymentHistoryServlet">View Payment History</a>
</div>
</body>
</html>
