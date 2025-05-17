package LoginAndLogout.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class LoginFileHandler {

    private static final String ADMINS = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\admins.txt";
    private static final String VENDORS = "C:\\Users\\oshad\\Desktop\\test\\OOPproject\\src\\main\\webapp\\Data\\vendor.txt";

    public static boolean validateAdmins(String adminId, String password) {
        return validateCredentials(ADMINS, adminId, hashPassword(password));
    }

    public static boolean validateVendors(String vendorId, String password) {
        return validateCredentials(VENDORS, vendorId, hashPassword(password));
    }

    private static boolean validateCredentials(String filePath, String userId, String hashedPassword) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.strip().split(",");
                if (parts.length == 2 &&
                        parts[0].strip().equals(userId) &&
                        parts[1].strip().equals(hashedPassword)) {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace(); // Consider replacing with a proper logging mechanism
        }
        return false;
    }

    private static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 algorithm not found.");
        }
    }
}
