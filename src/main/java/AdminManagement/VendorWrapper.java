package AdminManagement;

import VendorManagement.Vendor;

public class VendorWrapper implements User {
    private Vendor vendor;

    public VendorWrapper(Vendor vendor) {
        this.vendor = vendor;
    }

    @Override
    public String getUsername() { return vendor.getVendorId(); }
    @Override
    public String getEmail() { return null; }
    @Override
    public String getPassword() { return vendor.getPassword(); }
    @Override
    public void manageUsers() { /* Not needed */ }

    public Vendor getVendor() { return vendor; }
    public void setVendor(Vendor vendor) { this.vendor = vendor; }
}