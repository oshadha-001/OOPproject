package AdminManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/download")
public class Download extends HttpServlet {
    private static final String CUSTOMERS_FILE = "Data/customers.txt";
    private static final String VENDORS_FILE = "Data/vendor.txt";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = new ArrayList<>();
        List<CustomerWrapper> customerWrappers = FileHandler.readCustomers(getServletContext().getRealPath(CUSTOMERS_FILE));
        List<VendorWrapper> vendorWrappers = FileHandler.readVendors(getServletContext().getRealPath(VENDORS_FILE));
        users.addAll(customerWrappers);
        users.addAll(vendorWrappers);

        resp.setContentType("text/plain");
        resp.setHeader("Content-Disposition", "attachment; filename=\"user_details.txt\"");

        try (PrintWriter writer = resp.getWriter()) {
            writer.println("Username\tEmail");
            for (User user : users) {
                String email = user.getEmail() != null ? user.getEmail() : "-";
                writer.println(user.getUsername() + "\t" + email);
            }
        }
    }
}
