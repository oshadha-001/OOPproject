package ProductManagement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addProduct")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String vendor = request.getParameter("vendor");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        ProductManagement.Product product = new ProductManagement.Product(vendor, name, price, image);
        String path = getServletContext().getRealPath("/") + "product.txt";
        ProductService service = new ProductService(path);

        boolean success = service.saveProduct(product);

        if (success) {
            request.setAttribute("message", "You have successfully added your business to the system.");
        } else {
            request.setAttribute("message", "Failed to add product.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("addProduct.jsp");
        dispatcher.forward(request, response);
    }
}
