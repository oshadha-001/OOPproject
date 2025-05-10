package CustomerManagement;

// Base class for all users
public class User {
    protected String firstName;
    protected String lastName;
    protected String email;
    protected String password;
    protected String mobile;

    public User(String firstName, String lastName, String email, String password, String mobile) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
    }

    // Getters
    public String getFirstName() { return firstName; }
    public String getLastName()  { return lastName; }
    public String getEmail()     { return email; }
    public String getPassword()  { return password; }
    public String getMobile()    { return mobile; }
}
