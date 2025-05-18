package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerCRUD crud = new CustomerCRUD(getServletContext().getRealPath("Data/customers.txt"));
        CustomerLinkedList list = crud.getAllCustomersAsLinkedList();

        request.setAttribute("customerList", list.toList());
        request.getRequestDispatcher("ViewCustomer.jsp").forward(request, response);
    }
}

