package AdminManagement;

import CustomerManagement.Customer;
import VendorManagement.Vendor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {
    private static final String CUSTOMERS_FILE = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\customers.txt";
    private static final String VENDORS_FILE = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String indexParam = req.getParameter("index");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (indexParam == null || username == null || email == null || password == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Required parameters missing");
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

        User userToUpdate = users.get(index);
        List<CustomerWrapper> customerWrappers = new ArrayList<>();
        List<VendorWrapper> vendorWrappers = new ArrayList<>();

        for (User user : users) {
            if (user instanceof CustomerWrapper) customerWrappers.add((CustomerWrapper) user);
            else if (user instanceof VendorWrapper) vendorWrappers.add((VendorWrapper) user);
        }

        if (userToUpdate instanceof CustomerWrapper) {
            Customer customer = ((CustomerWrapper) userToUpdate).getCustomer();
            String[] customerData = customer.toCSV().split(",");
            customer = new Customer(customerData[0], customerData[1], email, password, customerData[4], customerData[5]);
            customerWrappers.set(index, new CustomerWrapper(customer));
            FileHandler.writeCustomers(getServletContext().getRealPath(CUSTOMERS_FILE), customerWrappers);
        } else if (userToUpdate instanceof VendorWrapper) {
            Vendor vendor = ((VendorWrapper) userToUpdate).getVendor();
            vendor = new Vendor(username, password, vendor.getName());
            vendorWrappers.set(index, new VendorWrapper(vendor));
            FileHandler.writeVendors(getServletContext().getRealPath(VENDORS_FILE), vendorWrappers);
        }

        users.set(index, userToUpdate);
        session.setAttribute("users", users);
        resp.sendRedirect("admin.jsp");
    }
}
