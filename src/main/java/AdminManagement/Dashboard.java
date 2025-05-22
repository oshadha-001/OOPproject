package AdminManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adminDashboard")
public class Dashboard extends HttpServlet {
    private static final String CUSTOMERS_FILE = "Data/customers.txt";
    private static final String VENDORS_FILE = "Data/vendor.txt";
    private static final String PRODUCTS_FILE = "Data/dresses.txt";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerWrapper> customerWrappers = FileHandler.readCustomers(getServletContext().getRealPath(CUSTOMERS_FILE));
        List<VendorWrapper> vendorWrappers = FileHandler.readVendors(getServletContext().getRealPath(VENDORS_FILE));
        List<Product> products = FileHandler.readProducts(getServletContext().getRealPath(PRODUCTS_FILE));

        List<User> users = new ArrayList<>();
        users.addAll(customerWrappers);
        users.addAll(vendorWrappers);

        HttpSession session = req.getSession();
        session.setAttribute("users", users);
        session.setAttribute("products", products);

        resp.sendRedirect("admin.jsp");
    }
}