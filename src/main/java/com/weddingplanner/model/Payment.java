package com.weddingplanner.model;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class Payment {
    private String customerName;
    private double amount;
    private String paymentMethod;

    // Constructor
    public Payment(String customerName, double amount, String paymentMethod) {
        this.customerName = customerName;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
    }

    // Getters
    public String getCustomerName() {
        return customerName;
    }

    public double getAmount() {
        return amount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    // Path to payment.txt (adjust based on your deployment location)
    private static String getFilePath() {
        // You can use a hardcoded absolute path OR
        // Use relative path and make sure it's under webapp
        return "C:\\Users\\pc\\Desktop\\github oop project\\OOPproject\\src\\main\\webapp\\Data\\payment.txt"; // ← Replace with your actual path
    }

    // Add new payment to file
    public static void addPayment(Payment payment) {
        try (FileWriter fw = new FileWriter(getFilePath(), true)) {
            fw.write(payment.customerName + "," + payment.amount + "," + payment.paymentMethod + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Read all payments from file
    public static List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(getFilePath()))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String name = parts[0];
                    double amount = Double.parseDouble(parts[1]);
                    String method = parts[2];
                    payments.add(new Payment(name, amount, method));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }

    // Delete payment by index
    public static void deletePayment(int index) {
        try {
            Path filePath = new File(getFilePath()).toPath();
            List<String> lines = new ArrayList<>(Files.readAllLines(filePath));
            if (index >= 0 && index < lines.size()) {
                lines.remove(index);
                Files.write(filePath, lines);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
