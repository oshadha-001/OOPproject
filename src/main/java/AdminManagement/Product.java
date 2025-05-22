package AdminManagement;

public class Product {
    private String vendor;
    private String name;
    private double price;
    private String imageUrl;

    public Product(String vendor, String name, double price, String imageUrl) {
        this.vendor = vendor;
        this.name = name;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public String getVendor() { return vendor; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
}
