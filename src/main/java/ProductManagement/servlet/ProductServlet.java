package ProductManagement.servlet;

import ProductManagement.model.Product;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/create-product")
public class ProductServlet extends HttpServlet {

    // Path to the products file (make sure this file path is correct on your system)
    private final String productFilePath = "E:\\Project\\OOPproject\\src\\main\\webapp\\Data\\products.txt";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get product details from the form
        String productID = req.getParameter("productID");
        String productName = req.getParameter("productName");

        // Validate the input (basic validation)
        if (productID == null || productName == null || productID.isEmpty() || productName.isEmpty()) {
            req.setAttribute("error", "Product ID and Name cannot be empty!");
            req.getRequestDispatcher("createProductForm.jsp").forward(req, resp);
            return;
        }

        // Create the Product object
        Product product = new Product(productID, productName);


        // Redirect to the product list page (or some confirmation page)
        resp.sendRedirect("productList.jsp");
    }
}
