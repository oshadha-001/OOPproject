package CustomerManagement;

import java.util.regex.*;

// Handles input validation
public class CustomerValidator {

    public static boolean isValidName(String name) {
        return name != null && name.matches("[A-Za-z]+");
    }

    public static boolean isValidEmail(String email) {
        String regex = "^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,6}$";
        return email != null && Pattern.matches(regex, email);
    }

    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }

    public static boolean isValidMobile(String mobile) {
        return mobile != null && mobile.matches("\\d{10,}");
    }

    public static boolean isValidAddress(String address) {
        return address != null && !address.trim().isEmpty();
    }
}
