package CustomerManagement;

import java.util.ArrayList;
import java.util.List;

public class CustomerLinkedList {
    private Link head;

    public void add(Customer c) {
        Link newLink = new Link(c);
        if (head == null) {
            head = newLink;
        } else {
            Link temp = head;
            while (temp.next != null)
                temp = temp.next;
            temp.next = newLink;
        }
    }

    public boolean deleteByEmail(String email) {
        if (head == null) return false;

        if (head.data.getEmail().equalsIgnoreCase(email)) {
            head = head.next;
            return true;
        }

        Link prev = head;
        Link curr = head.next;

        while (curr != null) {
            if (curr.data.getEmail().equalsIgnoreCase(email)) {
                prev.next = curr.next;
                return true;
            }
            prev = curr;
            curr = curr.next;
        }

        return false;
    }

    public List<Customer> toList() {
        List<Customer> customers = new ArrayList<>();
        Link temp = head;
        while (temp != null) {
            customers.add(temp.data);
            temp = temp.next;
        }
        return customers;
    }
}
