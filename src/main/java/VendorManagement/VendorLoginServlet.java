package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class VendorLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        Vendor vendor = new Vendor();
        vendor.setVendorId(vendorId);
        vendor.setPassword(password);

        VendorService vendorService = new VendorService();

        if (vendorService.loginVendor(vendor)) {
            // Create a session and store vendorId
            HttpSession session = request.getSession();
            session.setAttribute("vendorId", vendorId);

            // Redirect to dashboard or table page
            response.sendRedirect("WendorTable.jsp");
        } else {
            // Invalid login
            request.setAttribute("error", "Invalid Vendor ID or Password");
            request.getRequestDispatcher("VendorLogin.jsp").forward(request, response);
        }
    }
}
