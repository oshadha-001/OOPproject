package ProductManagement.model;


import java.io.*;
import java.util.*;

public class CrudFileHandler {

    private final String filePath;

    public CrudFileHandler(String filePath) {
        this.filePath = filePath;
    }

    public void addProduct(Product product) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            // Append product in CSV format
            String line = String.format("%s,%s,%.2f,%s",
                    product.getVendorId(),
                    product.getProductType(),
                    product.getPrice(),
                    product.getModel());
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getProductsByVendor(String vendorId) {
        List<Product> productList = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                // Split by comma and trim parts
                String[] parts = line.split(",");
                if (parts.length < 4) continue; // invalid line, skip

                String vId = parts[0].trim();
                String productType = parts[1].trim();

                double price;
                try {
                    price = Double.parseDouble(parts[2].trim());
                } catch (NumberFormatException e) {
                    // skip this malformed line
                    continue;
                }

                String model = parts[3].trim();

                if (vId.equals(vendorId)) {
                    productList.add(new Product(vId, productType, price, model));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public void deleteProduct(Product productToDelete) {
        File inputFile = new File(filePath);
        File tempFile = new File(filePath + ".tmp");

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile));
             BufferedWriter bw = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length < 4) {
                    bw.write(line);
                    bw.newLine();
                    continue;
                }
                String vId = parts[0].trim();
                String productType = parts[1].trim();
                String priceStr = parts[2].trim();
                String model = parts[3].trim();

                if (vId.equals(productToDelete.getVendorId()) &&
                        productType.equals(productToDelete.getProductType()) &&
                        priceStr.equals(String.format("%.2f", productToDelete.getPrice())) &&
                        model.equals(productToDelete.getModel())) {
                    // Skip this line to delete
                    continue;
                } else {
                    bw.write(line);
                    bw.newLine();
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        // Replace original file with temp file
        if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
            System.err.println("Could not replace original file after delete operation.");
        }
    }
}

