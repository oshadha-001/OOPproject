package ProductManagement.model;

public class Product {
    private String productID;
    private String productName;

    // Default constructor (optional but good practice)
    public Product() {}

    // Parameterized constructor
    public Product(String productID, String productName) {
        this.productID = productID;
        this.productName = productName;
    }

    // Getters
    public String getProductID() {
        return productID;
    }

    public String getProductName() {
        return productName;
    }

    // Setters (optional if you're not modifying)
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}
