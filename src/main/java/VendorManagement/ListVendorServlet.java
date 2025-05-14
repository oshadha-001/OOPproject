package VendorManagement;

import VendorManagement.Vendor;
import VendorManagement.VendorFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/listCourses")
public class ListVendorServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Vendor> vendors = VendorFileHandler.loadVendor();
        req.setAttribute("vendors", vendors);
        RequestDispatcher rd = req.getRequestDispatcher("Vendor.jsp");
        messenger.forward(request, response);
    }
}
