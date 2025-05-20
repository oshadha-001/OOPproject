package com.projectname.payment.controller;

import com.weddingplanner.model.Payment;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        Payment.deletePayment(index);
        response.sendRedirect("PaymentHistoryServlet");
    }
}

