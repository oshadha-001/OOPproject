package ProductManagement;

import java.io.*;

public class ProductService {
    private final String filePath;

    public ProductService(String filePath) {
        this.filePath = filePath;
    }

    public boolean saveProduct(Product product) {
        try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(filePath, true)))) {
            out.println(product.toCSV());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
