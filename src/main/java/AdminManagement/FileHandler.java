package AdminManagement;

import CustomerManagement.Customer;
import VendorManagement.Vendor;
//import com.google.gson.Gson;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {
    //private static final Gson gson = new Gson();

    public static List<CustomerWrapper> readCustomers(String filePath) throws IOException {
        List<CustomerWrapper> customerWrappers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 6) {
                    Customer customer = new Customer(data[0], data[1], data[2], data[3], data[4], data[5]);
                    customerWrappers.add(new CustomerWrapper(customer));
                }
            }
        }
        return customerWrappers;
    }

    public static void writeCustomers(String filePath, List<CustomerWrapper> customers) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (CustomerWrapper wrapper : customers) {
                Customer customer = wrapper.getCustomer();
                writer.write(String.format("%s,%s,%s,%s,%s,%s",
                        customer.getFirstName(), customer.getLastName(), customer.getEmail(),
                        customer.getPassword(), customer.getAddress()));
                writer.newLine();
            }
        }
    }

    public static List<VendorWrapper> readVendors(String filePath) throws IOException {
        List<VendorWrapper> vendorWrappers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            reader.readLine(); // Skip header
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 3) {
                    Vendor vendor = new Vendor(data[0], data[1], data[2]);
                    vendorWrappers.add(new VendorWrapper(vendor));
                }
            }
        }
        return vendorWrappers;
    }

    public static void writeVendors(String filePath, List<VendorWrapper> vendors) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write("ID,P.W.,Name");
            writer.newLine();
            for (VendorWrapper wrapper : vendors) {
                Vendor vendor = wrapper.getVendor();
                writer.write(String.format("%s,%s,%s", vendor.getVendorId(), vendor.getPassword(), vendor.getName()));
                writer.newLine();
            }
        }
    }

    public static List<Product> readProducts(String filePath) throws IOException {
        List<Product> products = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 4) {
                    products.add(new Product(data[0], data[1], Double.parseDouble(data[2]), data[3]));
                }
            }
        }
        return products;
    }

    /**public static String toJson(Object obj) {
        return gson.toJson(obj);
    }**/
}