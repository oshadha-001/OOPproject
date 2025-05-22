package ProductManagement.model;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import javax.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    private CrudFileHandler crudHandler;


    @Override
    public void init() throws ServletException {
        // Use the absolute path directly
        String filePath = "D:\\New folder (3)\\src\\main\\webapp\\Data\\Product.txt";
        crudHandler = new CrudFileHandler(filePath);
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vendorId = request.getParameter("vendorId");
        String productType = request.getParameter("productType");
        double price = Double.parseDouble(request.getParameter("price"));
        String model = request.getParameter("model");

        Product product = new Product(vendorId, productType, price, model);
        crudHandler.addProduct(product);

        // Redirect to viewProducts.jsp with vendorId param
        response.sendRedirect("viewProducts.jsp?vendorId=" + vendorId);
    }
}
