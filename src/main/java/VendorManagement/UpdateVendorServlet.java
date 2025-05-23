package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateVendor")
public class UpdateVendorServlet extends HttpServlet {
    private static final String VENDOR_FILE_PATH = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        String vendorId = request.getParameter("vendorId");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        VendorService vendorService = new VendorService();
        List<Vendor> vendors = vendorService.getAllVendors();

        if (index >= 0 && index < vendors.size()) {
            vendors.set(index, new Vendor(vendorId, password, name));
            vendorService.updateVendors(vendors);
            response.sendRedirect("vendor-data");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid vendor index");
        }
    }
}