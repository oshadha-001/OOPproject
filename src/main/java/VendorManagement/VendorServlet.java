package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/vendor")
public class VendorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost triggered"); // Debug log

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int setLimit = Integer.parseInt(request.getParameter("setLimit"));
        String creationDate = LocalDate.now().toString();

        Vendor vendor = new Vendor(name, email, password);
        String filePath = VendorFileHandler.getFilePath(request);
        VendorFileHandler.saveVendor(vendor, filePath);

        request.setAttribute("vendor", vendor);
        request.setAttribute("setLimit", setLimit);
        request.setAttribute("creationDate", creationDate);

        request.getRequestDispatcher("/vendor.jsp").forward(request, response);
    }
}
