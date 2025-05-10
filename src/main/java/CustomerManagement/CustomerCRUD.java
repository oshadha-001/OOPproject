package CustomerManagement;

import java.io.*;
import java.util.*;

public class CustomerCRUD {
    private final String filePath;

    public CustomerCRUD(String filePath) {
        this.filePath = filePath;
    }

    // Add new customer (if email not already used)
    public boolean addCustomer(Customer customer) throws IOException {
        // Check if the email is already registered
        if (findCustomerByEmail(customer.getEmail()) != null) {
            return false; // Email already exists, cannot add customer
        }

        // Append new customer data to the file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(customer.toCSV());
            writer.newLine(); // Add new line for the next customer
        }
        return true; // Successfully added
    }

    // Get all customers from the file
    public List<Customer> getAllCustomers() throws IOException {
        List<Customer> customers = new ArrayList<>();
        // Read customers from the file
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                customers.add(Customer.fromCSV(line)); // Parse each line into a Customer object
            }
        }
        return customers; // Return the list of customers
    }

    // Find a customer by email
    public Customer findCustomerByEmail(String email) throws IOException {
        // Search through all customers to find one with the matching email
        for (Customer c : getAllCustomers()) {
            if (c.getEmail().equalsIgnoreCase(email)) {
                return c; // Return the customer if email matches
            }
        }
        return null; // Return null if no matching email is found
    }

    // Update customer information by email
    public boolean updateCustomer(Customer updated) throws IOException {
        List<Customer> customers = getAllCustomers();
        boolean updatedFlag = false;

        // Rewrite the file with updated customer data
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Customer c : customers) {
                // Check if the customer email matches
                if (c.getEmail().equalsIgnoreCase(updated.getEmail())) {
                    writer.write(updated.toCSV()); // Write the updated customer data
                    updatedFlag = true; // Flag indicating customer was updated
                } else {
                    writer.write(c.toCSV()); // Write the original customer data
                }
                writer.newLine();
            }
        }
        return updatedFlag; // Return whether an update occurred
    }

    // Delete a customer by email
    public boolean deleteCustomer(String email) throws IOException {
        List<Customer> customers = getAllCustomers();
        boolean deleted = false;

        // Rewrite the file excluding the deleted customer
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Customer c : customers) {
                if (!c.getEmail().equalsIgnoreCase(email)) {
                    writer.write(c.toCSV()); // Write the remaining customers to the file
                    writer.newLine();
                } else {
                    deleted = true; // Flag indicating customer was deleted
                }
            }
        }
        return deleted; // Return whether a customer was deleted
    }
}
