package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/RemoveCustomerServlet")
public class RemoveCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        CustomerCRUD crud = new CustomerCRUD(getServletContext().getRealPath("Data/customers.txt"));
        crud.deleteCustomer(email);
        response.sendRedirect("ViewCustomerServlet"); // Refresh the list
    }
}
