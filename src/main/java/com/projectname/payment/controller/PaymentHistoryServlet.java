package com.projectname.payment.controller;

import com.weddingplanner.model.Payment;
import com.weddingplanner.utils.PaymentSorter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/PaymentHistoryServlet")
public class PaymentHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Payment> payments = Payment.getAllPayments();

        // Check if sort is requested
        String sort = request.getParameter("sort");
        if ("true".equals(sort)) {
            PaymentSorter.bubbleSortByAmountDesc(payments);
        }

        request.setAttribute("payments", payments);
        request.getRequestDispatcher("PaymentHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String paymentMethod = request.getParameter("paymentMethod");

        double amount;
        try {
            amount = Double.parseDouble(request.getParameter("amount"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid amount format.");
            request.getRequestDispatcher("PaymentForm.jsp").forward(request, response);
            return;
        }

        Payment newPayment = new Payment(customerName, amount, paymentMethod);
        Payment.addPayment(newPayment);

        response.sendRedirect("PaymentHistoryServlet");
    }
}
