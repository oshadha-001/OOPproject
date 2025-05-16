package VendorManagement;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;

public class VendorLoginServlet extends HttpServlet {

    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws IOException {

        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        Vendor vendor = new Vendor();
        vendor.setVendorId(vendorId);
        vendor.setPassword(password);

        VendorService vendorService = new VendorService();
        vendorService.loginVendor(vendor);

        response.sendRedirect("WendorTable.jsp");
    }
}