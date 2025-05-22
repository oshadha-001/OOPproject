package AdminManagement;

public class Admin implements User {
    private String username;
    private String email;
    private String password;
    private String permissions;

    public Admin(String username, String email, String password, String permissions) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.permissions = permissions;
    }

    @Override
    public String getUsername() { return username; }
    @Override
    public String getEmail() { return email; }
    @Override
    public String getPassword() { return password; }
    public String getPermissions() { return permissions; }
    public void setPermissions(String permissions) { this.permissions = permissions; }

    @Override
    public void manageUsers() {
        // Admin-specific logic
    }
}
