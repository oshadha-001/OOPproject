package com.weddingplanner.utils;

import com.weddingplanner.model.Payment;

import java.util.List;

public class PaymentSorter {

    // Bubble sort by amount in descending order (highest to lowest)
    public static void bubbleSortByAmountDesc(List<Payment> list) {
        int n = list.size();
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (list.get(j).getAmount() < list.get(j + 1).getAmount()) {
                    // Swap
                    Payment temp = list.get(j);
                    list.set(j, list.get(j + 1));
                    list.set(j + 1, temp);
                }
            }
        }
    }
}
