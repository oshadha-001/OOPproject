package VendorManagement;

import jakarta.servlet.http.HttpServletRequest;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class VendorFileHandler {

    public static String getFilePath(HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("F:/OOPproject/src/main/webapp/Data/Vendor.txt");
        File file = new File(path);
        file.getParentFile().mkdirs(); // Ensure parent directories exist
        return path;
    }

    public static void saveVendor(Vendor vendor, String filePath) throws IOException {
        File file = new File(filePath);
        file.getParentFile().mkdirs(); // Ensure directories exist

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(vendor.getName());
            writer.newLine();
            writer.write(vendor.getEmail());
            writer.newLine();
            writer.write(vendor.getPassword());
            writer.newLine();
            writer.write("-----");
            writer.newLine();
        }
    }

    public static List<Vendor> loadVendors(String filePath) throws IOException {
        List<Vendor> vendors = new ArrayList<>();
        File file = new File(filePath);

        if (!file.exists()) return vendors;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String name = null, email = null, password = null;
            String line;
            int lineCount = 0;

            while ((line = reader.readLine()) != null) {
                if (line.equals("-----")) {
                    if (name != null && email != null && password != null) {
                        vendors.add(new Vendor(name, email, password));
                    }
                    name = email = password = null;
                    lineCount = 0;
                } else {
                    if (lineCount == 0) name = line;
                    else if (lineCount == 1) email = line;
                    else if (lineCount == 2) password = line;
                    lineCount++;
                }
            }
        }

        return vendors;
    }
}
