package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class VendorLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        // Validate inputs
        if (vendorId == null || password == null || vendorId.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Vendor ID and Password must not be empty.");
            request.getRequestDispatcher("VendorLogin.jsp").forward(request, response);
            return;
        }

        Vendor vendor = new Vendor();
        vendor.setVendorId(vendorId);
        vendor.setPassword(password);

        VendorService vendorService = new VendorService();

        boolean isSuccess = vendorService.loginVendor(vendor);

        // Log attempt
        logLoginAttempt(vendorId, isSuccess, request);

        if (isSuccess) {
            HttpSession session = request.getSession();
            session.setAttribute("vendorId", vendorId);
            response.sendRedirect("WendorTable.jsp");
        } else {
            request.setAttribute("error", "Invalid Vendor ID or Password");
            request.getRequestDispatcher("VendorLogin.jsp").forward(request, response);
        }
    }

    private void logLoginAttempt(String vendorId, boolean success, HttpServletRequest request) {

        try {
            String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String logDirPath = getServletContext().getRealPath("/Data");

            File logDir = new File(logDirPath);
            if (!logDir.exists()) {
                logDir.mkdirs();
            }

            String fileName = logDirPath + File.separator + "F:\\OOPproject\\src\\main\\webapp\\Data\\VendorLOGIN.txt";

            // Create log entry
            String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            String status = success ? "SUCCESS" : "FAILED";
            String logEntry = String.format("%s - VendorID: %s - Status: %s%n", timestamp, vendorId, status);

            try (BufferedWriter bw = new BufferedWriter(new FileWriter(fileName, true))) {
                bw.write(logEntry);
            }

        } catch (IOException e) {
            e.printStackTrace(); // Optional: log to servlet context or a logger
        }
    }
}
