package ProductManagement;

public class Product {
    private String vendor;
    private String name;
    private double price;
    private String image;

    public Product(String vendor, String name, double price, String image) {
        this.vendor = vendor;
        this.name = name;
        this.price = price;
        this.image = image;
    }

    public String getVendor() { return vendor; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImage() { return image; }

    public String toCSV() {
        return vendor + "," + name + "," + price + "," + image;
    }
}
