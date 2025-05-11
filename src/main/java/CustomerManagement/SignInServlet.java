package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

public class SignInServlet extends HttpServlet {

    private CustomerCRUD crud;

    @Override
    public void init() throws ServletException {
        String filePath = getServletContext().getRealPath("Data/customers.txt");
        crud = new CustomerCRUD(filePath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        if (!CustomerValidator.isValidEmail(email) || !CustomerValidator.isValidPassword(password)) {
            request.setAttribute("errorMessage", "Invalid email or password format");
            request.getRequestDispatcher("customerSignIn.jsp").forward(request, response);
            return;
        }

        Customer customer = crud.findCustomerByEmail(email);

        if (customer != null && customer.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);

            if ("on".equals(remember)) {
                Cookie emailCookie = new Cookie("rememberEmail", email);
                emailCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                response.addCookie(emailCookie);
            } else {
                Cookie emailCookie = new Cookie("rememberEmail", "");
                emailCookie.setMaxAge(0);
                response.addCookie(emailCookie);
            }

            response.sendRedirect("customerHome.jsp");
        } else {
            request.setAttribute("errorMessage", "Incorrect email or password");
            request.getRequestDispatcher("customerSignIn.jsp").forward(request, response);
        }
    }
}
