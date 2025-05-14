package VendorManagement;
import VendorManagement.Vendor;
import VendorManagement.VendorFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/addCourse")
public class AddVendorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String names = request.getParameter("names");
        String Surnames = request.getParameter("Surnames");
        String Email = request.getParameter("Email");
        String Password = request.getParameter("Password");

        Vendor newVendor = new Vendor(names, Surnames, Email, Password);

        VendorFileHandler.saveVendor(newVendor);

        response.sendRedirect("VendorSignIn.html");
    }

}
