package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileWriter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/deleteVendor")
public class DeleteVendorServlet extends HttpServlet {
    private static final String VENDOR_FILE_PATH = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        VendorService vendorService = new VendorService();
        List<Vendor> vendors = vendorService.getAllVendors();

        if (index >= 0 && index < vendors.size()) {
            vendors.remove(index);
            // Rewrite the vendor.txt file
            try (PrintWriter writer = new PrintWriter(new FileWriter(VENDOR_FILE_PATH))) {
                for (Vendor vendor : vendors) {
                    writer.println(vendor.getVendorId() + "," + vendor.getPassword() + "," + vendor.getName());
                }
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}