package ProductManagement.model;

public class Product {
    private String vendorId;
    private String productType;
    private double price;
    private String model;

    public Product(String vendorId, String productType, double price, String model) {
        this.vendorId = vendorId;
        this.productType = productType;
        this.price = price;
        this.model = model;
    }

    public Product(String productID, String productName) {

    }

    public String getVendorId() {
        return vendorId;
    }

    public String getProductType() {
        return productType;
    }

    public double getPrice() {
        return price;
    }

    public String getModel() {
        return model;
    }
}

