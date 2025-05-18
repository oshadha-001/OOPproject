package CustomerManagement;

// CustomerLinkedList.java
import java.util.ArrayList;
import java.util.List;

public class CustomerLinkedList {
    private Node head;

    public void add(Customer c) {
        Node newNode = new Node(c);
        if (head == null) {
            head = newNode;
        } else {
            Node temp = head;
            while (temp.next != null)
                temp = temp.next;
            temp.next = newNode;
        }
    }

    public boolean deleteByEmail(String email) {
        if (head == null) return false;

        if (head.data.getEmail().equalsIgnoreCase(email)) {
            head = head.next;
            return true;
        }

        Node prev = head;
        Node curr = head.next;

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
        Node temp = head;
        while (temp != null) {
            customers.add(temp.data);
            temp = temp.next;
        }
        return customers;
    }
}
