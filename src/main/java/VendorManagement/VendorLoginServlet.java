package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/vendor")
public class VendorLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        // Path to the credentials file
        String credentialsFilePath = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";
        // Path to the login log file
        String loginLogFilePath = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\VendorLOGIN.txt";

        boolean isValid = validateCredentials(vendorId, password, credentialsFilePath);

        if (isValid) {
            // Log the successful login
            logLoginAttempt(vendorId, loginLogFilePath);

            // Successful login: Store vendorId in session and redirect
            request.getSession().setAttribute("vendorId", vendorId);
            response.sendRedirect("VenderTable.jsp"); // Replace with your dashboard page
        } else {
            // Failed login: Set error message and forward back to login page
            request.setAttribute("error", "Invalid Vendor ID or Password");
            request.getRequestDispatcher("vendorLogin.jsp").forward(request, response);
        }
    }

    private boolean validateCredentials(String vendorId, String password, String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String fileVendorId = parts[0].trim();
                    String filePassword = parts[1].trim();
                    if (fileVendorId.equals(vendorId) && filePassword.equals(password)) {
                        return true; // Credentials match
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return false; // No match found or error occurred
    }

    private void logLoginAttempt(String vendorId, String logFilePath) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(logFilePath, true))) {
            // Format the current timestamp
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String timestamp = now.format(formatter);

            // Write login details to the file
            writer.println("Vendor ID: " + vendorId + ", Login Time: " + timestamp);
        } catch (IOException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
    }
}