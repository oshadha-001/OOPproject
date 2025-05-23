package VendorManagement;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class VendorService {

    private static final String VENDOR_FILE_PATH = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    public void registerVendor(Vendor vendor) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(VENDOR_FILE_PATH, true))) {
            writer.println(vendor.getVendorId() + "," + vendor.getPassword() + "," + vendor.getName());
        } catch (IOException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
    }

    public List<Vendor> getAllVendors() {
        List<Vendor> vendors = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(VENDOR_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String vendorId = parts[0].trim();
                    String password = parts[1].trim();
                    String name = parts[2].trim();
                    vendors.add(new Vendor(vendorId, password, name));
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return vendors;
    }

    public void updateVendors(List<Vendor> vendors) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(VENDOR_FILE_PATH))) {
            for (Vendor vendor : vendors) {
                writer.println(vendor.getVendorId() + "," + vendor.getPassword() + "," + vendor.getName());
            }
        } catch (IOException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
    }
}