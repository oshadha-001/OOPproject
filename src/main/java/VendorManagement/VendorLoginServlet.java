package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@WebServlet("/vendor")
public class VendorLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        // Path to the text file (adjust as needed)
        String filePath = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

        boolean isValid = validateCredentials(vendorId, password, filePath);

        if (isValid) {
            // Successful login: Redirect to a dashboard or home page
            request.getSession().setAttribute("vendorId", vendorId); // Store vendorId in session
            response.sendRedirect("dashboard.jsp"); // ReplaceWith your dashboard page
        } else {
            // Failed login: Set error message and forward back to loginpage
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
            e.printStackTrace(); // Log the error (consider using a proper logging framework)
        }
        return false; // No match found or error occurred
    }
}