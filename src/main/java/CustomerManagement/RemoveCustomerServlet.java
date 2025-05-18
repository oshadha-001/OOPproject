package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/RemoveCustomerServlet")
public class RemoveCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        CustomerCRUD crud = new CustomerCRUD(getServletContext().getRealPath("Data/customers.txt"));
        boolean deleted = crud.deleteCustomerUsingLinkedList(email);

        if (deleted) {
            request.setAttribute("message", "Customer removed successfully.");
        } else {
            request.setAttribute("error", "Customer not found.");
        }

        CustomerLinkedList list = crud.getAllCustomersAsLinkedList();
        request.setAttribute("customerList", list.toList());
        request.getRequestDispatcher("ViewCustomer.jsp").forward(request, response);
    }
}

