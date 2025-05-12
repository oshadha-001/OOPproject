package VendorManagement;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;


public class VendorServlet extends HttpServlet {
    private final String filePath = "F:\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "register":
                    registerVendor(request, response);
                    break;
                case "login":
                    loginVendor(request, response);
                    break;
                default:
                    request.setAttribute("message", "Invalid action!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("message", "No action specified!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void registerVendor(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Username and password are required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        File file = new File(filePath);
        try {
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }

            // Check if user already exists
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length > 0 && parts[0].equals(username)) {
                        request.setAttribute("message", "User already exists!");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // Register new user
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                writer.write(username + "," + password);
                writer.newLine();
            }

            request.setAttribute("message", "Registration successful!");
            request.getRequestDispatcher("VendorSignIn.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("message", "Error processing registration!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void loginVendor(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Username and password are required!");
            request.getRequestDispatcher("VendorSignIn.jsp").forward(request, response);
            return;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2 && parts[0].equals(username) && parts[1].equals(password)) {
                    request.setAttribute("message", "Login successful!");
                    request.getRequestDispatcher("welcome.jsp").forward(request, response);
                    return;
                }
            }
            request.setAttribute("message", "Invalid credentials!");
            request.getRequestDispatcher("VendorSignIn.jsp").forward(request, response);
        } catch (IOException e) {
            request.setAttribute("message", "Error processing login!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}