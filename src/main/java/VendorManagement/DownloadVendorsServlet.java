package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/downloadVendors")
public class DownloadVendorsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VendorService vendorService = new VendorService();
        List<Vendor> vendors = vendorService.getAllVendors();

        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename = vendors.txt");

        try (PrintWriter writer = response.getWriter()) {
            writer.println("Vendor ID,Name,Password");
            for (Vendor vendor : vendors) {
                writer.println(vendor.getVendorId() + "," + vendor.getName() + "," + vendor.getPassword());
            }
        }
    }
}