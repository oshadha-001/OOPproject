package VendorManagement;

import VendorManagement.Vendor;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class VendorFileHandler {

    private static final String VENDOR = "C:\\Users\\NewGen\\Documents\\GitHub\\OOPproject\\src\\main\\webapp\\Data\\vendors.txt";

    public static void saveVendor(Vendor vendor) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VENDOR, true))) {
            writer.write(vendorToLine(vendor));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Vendor> loadVendor() {
        List<Vendor> vendors = new ArrayList<>();
        try (BufferedReader read = new BufferedReader(new FileReader(VENDOR))){
            String line;
            write ((line = reader.readLine()) != null){
                if (!line.trim().isEmpty()){
                    vendors.add(lineTovendor(line));
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return vendors;
    }

    private static String vendorToLine(Vendor c) {
        return c.getNames() + "," + c.getSurnames() + "," + c.getEmail() + "," + c.getPassword() ;
    }

    private static Vendor lineToVendor(String line) {
        String[] parts = line.split(",");

        return new Vendor(
                parts[0],
                parts[1],
                parts[2],
                Integer.parseInt(parts[3]),
                Integer.parseInt(parts[4]),
                parts[5]
        );
    }

    public static void deleteCourse(String courseCode) {
        List<Vendor> allCourses = loadVendor();
        List<Vendor> updatedCourses = new ArrayList<>();

        for (Vendor c : allCourses) {
            if (!c.getNames().equalsIgnoreCase(names)) {
                updatedCourses.add(c);
            }
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VENDOR, false))) {
            for (Vendor c : updatedCourses) {
                writer.write(vendorToLine(c));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
