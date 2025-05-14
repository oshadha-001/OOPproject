package VendorManagement;

public class Vendor {

    private String names;
    private String surnames;
    private String email;
    private String password;

    public Vendor(String names, String surnames, String email, String password) {
        this.names = names;
        this.surnames = surnames;
        this.email = email;
        this.password = password;
    }

    public String getNames() {
        return names;
    }

    public String getSurnames() {
        return surnames;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }




}
