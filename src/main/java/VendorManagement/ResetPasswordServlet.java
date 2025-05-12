package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ResetPasswordServlet extends HttpServlet {
    private final String filePath = "F:\\OOPproject\\src\\main\\webapp\\Data\\users.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        File file = new File(filePath);
        List<String> lines = new ArrayList<>();
        boolean updated = false;

        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts[0].equals(username)) {
                lines.add(username + "," + newPassword);
                updated = true;
            } else {
                lines.add(line);
            }
        }
        reader.close();

        if (updated) {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));
            for (String l : lines) {
                writer.write(l);
                writer.newLine();
            }
            writer.close();
            request.setAttribute("message", "Password reset successfully!");
        } else {
            request.setAttribute("message", "Username not found.");
        }

        request.getRequestDispatcher("VendorSignIn.jsp").forward(request, response);
    }
}
