package com.projectname.payment.controller;

import com.weddingplanner.model.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        Payment payment = new Payment(customerName, amount, paymentMethod);
        Payment.addPayment(payment);

        response.sendRedirect("PaymentHistoryServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            Payment.deletePayment(paymentId);
            response.sendRedirect("PaymentHistoryServlet");
        }
    }
}