package ProductManagement.model;

public class Product {
    private String productID;
    private String productName;

    // Default constructor (optional but good practice)
    public Product(String vendorId, String productType, double price, String model) {
    }

    // Parameterized constructor
    public Product(String productID, String productName) {
        this.productID = productID;
        this.productName = productName;
    }

    // Getters
    public String getProductID() {
        return productID;
    }

    // Setters (optional if you're not modifying)
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}
