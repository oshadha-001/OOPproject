package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/api/auth/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        // Ensure the Data directory exists
        File dataDir = new File("F:/OOPproject/src/main/webapp/Data");
        if (!dataDir.exists()) {
            dataDir.mkdirs();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Get form parameters
        String names = request.getParameter("names");
        String surnames = request.getParameter("surnames");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String, Object> jsonResponse = new HashMap<>();
        PrintWriter out = response.getWriter();

        // Validate input
        if (names == null || surnames == null || email == null || password == null ||
            names.isEmpty() || surnames.isEmpty() || email.isEmpty() || password.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "All fields are required");
            out.print(new com.google.gson.Gson().toJson(jsonResponse));
            out.flush();
            return;
        }

        // Check if email is already registered
        if (AuthFileHandler.isEmailRegistered(email)) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Email is already registered");
            out.print(new com.google.gson.Gson().toJson(jsonResponse));
            out.flush();
            return;
        }

        // Save registration details
        boolean saved = AuthFileHandler.saveRegistration(names, surnames, email, password);
        if (saved) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "Registration successful");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Failed to save registration");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        out.print(new com.google.gson.Gson().toJson(jsonResponse));
        out.flush();
    }
}