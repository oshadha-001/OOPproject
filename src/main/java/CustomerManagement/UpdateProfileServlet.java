package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private CustomerCRUD crud;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("Data/customers.txt");
        crud = new CustomerCRUD(filePath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("customerSignIn.jsp?error=Please+log+in+first");
            return;
        }

        String email = customer.getEmail();
        boolean updated = false;

        // Try each field one by one
        String fname = request.getParameter("fname");
        if (fname != null && !fname.equals(customer.getFirstName())) {
            updated = crud.updateCustomer(email, fname);
        }

        String lname = request.getParameter("lname");
        if (lname != null && !lname.equals(customer.getLastName())) {
            updated = crud.updateCustomer(email, lname, true);
        }

        String mobile = request.getParameter("mobile");
        if (mobile != null && !mobile.equals(customer.getMobile())) {
            updated = crud.updateCustomer(email, 0, mobile);
        }

        String password = request.getParameter("pw");
        if (password != null && !password.equals(customer.getPassword())) {
            updated = crud.updateCustomer(email, password, 0);
        }

        String address = request.getParameter("line1");
        if (address != null && !address.equals(customer.getAddress())) {
            updated = crud.updateCustomer(email, true, address);
        }

        if (updated) {
            Customer updatedCustomer = crud.findCustomerByEmail(email);
            session.setAttribute("customer", updatedCustomer);
            response.sendRedirect("profile.jsp?message=Successfully+updated+profile");
        } else {
            response.sendRedirect("profile.jsp?message=No+changes+were+made+or+invalid+input");
        }
    }
}

