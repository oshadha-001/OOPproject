package VendorManagement;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AuthFileHandler {
    private static final String REGISTER_FILE = "F:/OOPproject/src/main/webapp/Data/registered_users.txt";
    private static final String LOGIN_FILE = "F:/OOPproject/src/main/webapp/Data/login_attempts.txt.txt";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    // Save registration details
    public static boolean saveRegistration(String names, String surnames, String email, String password) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(REGISTER_FILE, true))) {
            LocalDateTime now = LocalDateTime.now();
            String timestamp = now.format(formatter);
            String entry = String.format("[%s] Name: %s, Surname: %s, Email: %s, Password: %s%n",
                    timestamp, names, surnames, email, password);
            writer.write(entry);
            return true;
        } catch (IOException e) {
            System.err.println("Error writing to registration file: " + e.getMessage());
            return false;
        }
    }

    // Save login attempt
    public static boolean saveLoginAttempt(String email) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(LOGIN_FILE, true))) {
            LocalDateTime now = LocalDateTime.now();
            String timestamp = now.format(formatter);
            String entry = String.format("[%s] Login attempt for email: %s%n", timestamp, email);
            writer.write(entry);
            return true;
        } catch (IOException e) {
            System.err.println("Error writing to login file: " + e.getMessage());
            return false;
        }
    }

    // Verify user credentials (for login)
    public static boolean verifyCredentials(String email, String password) {
        try (BufferedReader reader = new BufferedReader(new FileReader(REGISTER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Email: " + email) && line.contains("Password: " + password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading registration file: " + e.getMessage());
        }
        return false;
    }


    // Check if email already exists
    public static boolean isEmailRegistered(String email) {
        try (BufferedReader reader = new BufferedReader(new FileReader(REGISTER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Email: " + email)) {
                    return true;
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading registration file: " + e.getMessage());
        }
        System.out.println("Current working directory: " + System.getProperty("user.dir"));
        return false;

    }


}