package LoginAndLogout.servlet;

import LoginAndLogout.utils.LoginFileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/vendorLogin")
public class VendorLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String vendorId = request.getParameter("vendorId");
        String password = request.getParameter("password");

        if (LoginFileHandler.validateVendors(vendorId,password)) {
            request.getSession().setAttribute("vendorId",vendorId);
            response.sendRedirect("VenderTable.jsp");
        } else {
            request.setAttribute("error", "Invalid vendor credentials");
            request.getRequestDispatcher("VenderTable.jsp").forward(request,response);
        }
    }
}
