package VendorManagement;

public class Vendor {

    private String vendorId;
    private String password;
    private String name;

    public Vendor() {}

    public Vendor(String vendorId, String password, String name) {
        this.vendorId = vendorId;
        this.password = password;
        this.name = name;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
