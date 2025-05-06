package VendorBooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/saveDress")
public class SaveDressServlet extends HttpServlet {

    private static final String FILE_PATH = "dress_data.txt"; // <-- update this path

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vendor = request.getParameter("vendor");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        if (vendor != null && name != null && price != null && image != null) {
            try (FileWriter fw = new FileWriter(FILE_PATH, true);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter out = new PrintWriter(bw)) {

                out.println(vendor + "," + name + "," + price + "," + image);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (IOException e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                e.printStackTrace();
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
