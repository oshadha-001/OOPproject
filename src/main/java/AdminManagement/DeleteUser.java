package AdminManagement;

import CustomerManagement.Customer;
import VendorManagement.Vendor; // Added import for Vendor
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
    private static final String CUSTOMERS_FILE = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\customer.txt";
    private static final String VENDORS_FILE = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String indexParam = req.getParameter("index");
        if (indexParam == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Index parameter is required");
            return;
        }

        int index = Integer.parseInt(indexParam);
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        List<User> users = (List<User>) session.getAttribute("users");
        if (users == null || index < 0 || index >= users.size()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            return;
        }

        User userToDelete = users.get(index);
        List<CustomerWrapper> customerWrappers = new ArrayList<>();
        List<VendorWrapper> vendorWrappers = new ArrayList<>();

        // Separate users into customer and vendor wrappers
        for (User user : users) {
            if (user instanceof CustomerWrapper) customerWrappers.add((CustomerWrapper) user);
            else if (user instanceof VendorWrapper) vendorWrappers.add((VendorWrapper) user);
        }

        // Perform deletion based on user type
        if (userToDelete instanceof CustomerWrapper) {
            Customer customer = ((CustomerWrapper) userToDelete).getCustomer();
            customerWrappers.removeIf(wrapper -> wrapper.getUsername().equals(customer.getEmail()));
            FileHandler.writeCustomers(getServletContext().getRealPath(CUSTOMERS_FILE), customerWrappers);
        } else if (userToDelete instanceof VendorWrapper) {
            Vendor vendor = ((VendorWrapper) userToDelete).getVendor();
            vendorWrappers.removeIf(wrapper -> wrapper.getUsername().equals(vendor.getVendorId()));
            FileHandler.writeVendors(getServletContext().getRealPath(VENDORS_FILE), vendorWrappers);
        }

        // Update the session list
        users.remove(index);
        session.setAttribute("users", users);
        resp.sendRedirect("admin.jsp");
    }
}
