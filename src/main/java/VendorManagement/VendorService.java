package VendorManagement;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class VendorService {

    private final String FilePath = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";
    public void registerVendor(Vendor vendor) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(FilePath,true));
            writer.write(vendor.getVendorId() + "," +vendor.getPassword() + "," + vendor.getName());
            writer.newLine();
            writer.close();

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void loginVendor(Vendor vendor) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(FilePath));

            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.strip().split(",");
                if (parts.length == 3 &&
                        parts[0].strip().equals(vendor.getVendorId()) &&
                        parts[1].strip().equals(vendor.getPassword())) {
                    vendor.setName(parts[2]);
                    break;
                        }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}
