package ProductManagement.service;

import ProductManagement.model.Product;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class ProductService {

    // Method to save product to a file
    public void saveProduct(Product product, String filePath) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(product.getProductID() + "," + product.getProductName());
            writer.newLine();  // To separate each product by a new line
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
