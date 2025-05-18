package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewCustomerServlet")
public class ViewCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerCRUD crud = new CustomerCRUD(getServletContext().getRealPath("Data/customers.txt"));
        List<Customer> customerList = crud.getAllCustomers();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("ViewCustomer.jsp").forward(request, response);
    }
}

