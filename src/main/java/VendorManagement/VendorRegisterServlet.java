package VendorManagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/vendor-register")
public class VendorRegisterServlet extends HttpServlet {


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        String password = req.getParameter("password");
        String name = req.getParameter("vendorName");

        Vendor vendor = new Vendor(vendorId, password, name);
        VendorService vendorService = new VendorService();
        vendorService.registerVendor(vendor);
        resp.sendRedirect("vendorLogin.jsp");
    }
}
