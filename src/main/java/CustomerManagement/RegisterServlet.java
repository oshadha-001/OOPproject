package CustomerManagement;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;

public class RegisterServlet extends HttpServlet {

    private static final String FILE_PATH = "C:\\Users\\NewGen\\Documents\\GitHub\\OOPproject\\src\\main\\webapp\\Data\\customers.txt"; // Update this with the correct path to your customers file
    private CustomerCRUD customerCRUD = new CustomerCRUD(FILE_PATH);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("Address");

        // Validate input fields using CustomerValidator
        if (!CustomerValidator.isValidName(fname) || !CustomerValidator.isValidName(lname) ||
                !CustomerValidator.isValidEmail(email) || !CustomerValidator.isValidPassword(password) ||
                !CustomerValidator.isValidMobile(mobile) || !CustomerValidator.isValidAddress(address)) {

            // If validation fails, show an error message and forward back to registration page
            request.setAttribute("errorMessage", "Please fill all fields correctly");
            request.getRequestDispatcher("/customerRegistration.jsp").forward(request, response);
            return;
        }

        // Create new customer object
        Customer customer = new Customer(fname, lname, email, password, mobile, address);

        // Check if a customer with the given email already exists
        if (customerCRUD.findCustomerByEmail(email) != null) {
            // If email already exists, send error message back to registration page
            request.setAttribute("errorMessage", "User with the given email already exists.");
            request.getRequestDispatcher("/customerRegistration.jsp").forward(request, response);
        } else {
            // Add the new customer to the system
            boolean isAdded = customerCRUD.addCustomer(customer);
            if (isAdded) {
                // If customer is added successfully, redirect to login page
                response.sendRedirect("customerSignIn.jsp");
            } else {
                // If adding customer failed, show an error message
                request.setAttribute("errorMessage", "Failed to register user. Please try again.");
                request.getRequestDispatcher("/customerRegistration.jsp").forward(request, response);
            }
        }
    }
}
