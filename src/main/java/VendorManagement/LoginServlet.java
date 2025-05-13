package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/api/auth/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Get form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String, Object> jsonResponse = new HashMap<>();
        PrintWriter out = response.getWriter();

        // Validate input
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Email and password are required");
            out.print(new com.google.gson.Gson().toJson(jsonResponse));
            out.flush();
            return;
        }

        // Log the login attempt
        AuthFileHandler.saveLoginAttempt(email);

        // Verify credentials
        if (AuthFileHandler.verifyCredentials(email, password)) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "Login successful");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Invalid email or password");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }

        out.print(new com.google.gson.Gson().toJson(jsonResponse));
        out.flush();
    }
}