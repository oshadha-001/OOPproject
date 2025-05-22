package AdminManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getUsers")
public class GetUsers extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        List<User> users = (List<User>) session.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
        }

        // Set response content type to plain text
        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();

        // Write each user's details as a plain text line
        if (users.isEmpty()) {
            out.write("No users found.");
        } else {
            for (User user : users) {
                out.println(user.toString()); // Assumes User has a toString method
            }
        }
    }
}