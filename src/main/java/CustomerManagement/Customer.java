package CustomerManagement;

// Customer extends User and adds address
public class Customer extends User {
    private String address;

    public Customer(String firstName, String lastName, String email, String password, String mobile, String address) {
        super(firstName, lastName, email, password, mobile);
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {this.address = address; }

    // Save as comma-separated string
    public String toCSV() {
        return String.join(",", firstName, lastName, email, password, mobile, address);
    }

    // Convert from CSV string to Customer object
    public static Customer fromCSV(String csv) {
        String[] data = csv.split(",");
        if (data.length < 6) return null;
        return new Customer(data[0], data[1], data[2], data[3], data[4], data[5]);
    }
}
