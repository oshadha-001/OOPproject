package VendorBooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/saveDress")
public class SaveDressServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vendor = request.getParameter("vendor");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        // File path can be customized
        String filePath = getServletContext().getRealPath("/") + "Data/dresses.txt";

        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, true))) {
            writer.println("Vendor: " + vendor);
            writer.println("Name: " + name);
            writer.println("Price: " + price);
            writer.println("Image URL: " + image);
            writer.println("-----");
        }

        response.setContentType("text/plain");
        response.getWriter().write("Dress saved.");
    }
}
