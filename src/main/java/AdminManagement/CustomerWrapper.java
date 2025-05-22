package AdminManagement;

import CustomerManagement.Customer;

public class CustomerWrapper implements User {
    private Customer customer;

    public CustomerWrapper(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String getUsername() { return customer.getEmail(); }
    @Override
    public String getEmail() { return customer.getEmail(); }
    @Override
    public String getPassword() { return customer.getPassword(); }
    @Override
    public void manageUsers() { /* Not needed */ }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }
}
