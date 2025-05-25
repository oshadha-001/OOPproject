<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Wedding Vendor Attire Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        body {
            background-color: #e0abab;
            color: white;
            font-family: Arial, sans-serif;
            font-size: 18px;
        }

        header {
            background-color: black;
            padding: 10px;
        }

        .navbar-brand {
            color: #FFC0CB !important;
            font-size: 20px;
        }

        .navbar-nav .nav-link {
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #FFC0CB !important;
        }

        .container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #FFC0CB;
            border-radius: 5px;
            background-color: white;
            color: black;
            font-size: 16px;
        }

        button {
            background-color: #FFC0CB;
            color: black;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #FF69B4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #444;
        }

        th {
            background-color: #fdc1c1;
            color: #FFC0CB;
        }

        td {
            background-color: #2a2a2a;
        }

        td img {
            width: 60px;
            border-radius: 5px;
        }

        tr:hover {
            background-color: #e0abab;
        }

        .go-back-btn {
            margin: 30px;
            background-color: #6c757d;
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
        }

        .filter-sort-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            gap: 10px;
            flex-wrap: wrap;
        }

        .filter-sort-buttons select {
            max-width: 200px;
        }
    </style>
</head>
<body>

<header class="py-3">
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-primary" href="#">Wedding Vendor Attire Store</a>
        </div>
    </nav>
</header>

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="card-title mb-4">Add New Dress</h4>
            <form id="dressForm">
                <input type="text" id="vendor-name" placeholder="Vendor Name" required>
                <input type="text" id="dress-name" placeholder="Dress Name" required>
                <input type="number" id="dress-price" placeholder="Price" min="0" required>
                <input type="url" id="dress-image" placeholder="Image URL" required>
                <button type="submit">Add Dress</button>
            </form>
        </div>
    </div>

    <div class="filter-sort-buttons">
        <button onclick="sortByPrice()">Sort by Price</button>
        <select id="vendorFilter" onchange="filterByVendor()">
            <option value="">Filter by Vendor</option>
        </select>
    </div>

    <div class="table-responsive mt-4">
        <table class="table table-bordered align-middle text-center" id="dressTable">
            <thead class="table-dark">
            <tr>
                <th>Vendor</th>
                <th>Dress Name</th>
                <th>Price</th>
                <th>Image</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

<button class="go-back-btn" onclick="location.href='index.jsp'">
    <i class="fas fa-arrow-left"></i> Back to Home
</button>

<script>
    // Linked List Implementation
    class Node {
        constructor(dress) {
            this.data = dress;
            this.next = null;
        }
    }

    class LinkedList {
        constructor() {
            this.head = null;
        }

        append(dress) {
            const newNode = new Node(dress);
            if (!this.head) {
                this.head = newNode;
                return;
            }
            let current = this.head;
            while (current.next) {
                current = current.next;
            }
            current.next = newNode;
        }

        toArray() {
            const arr = [];
            let current = this.head;
            while (current) {
                arr.push(current.data);
                current = current.next;
            }
            return arr;
        }

        bubbleSortDescendingByPrice() {
            if (!this.head || !this.head.next) return;

            let swapped;
            do {
                swapped = false;
                let current = this.head;
                while (current.next) {
                    if (parseFloat(current.data.price) < parseFloat(current.next.data.price)) {
                        // Swap dress data
                        const temp = current.data;
                        current.data = current.next.data;
                        current.next.data = temp;
                        swapped = true;
                    }
                    current = current.next;
                }
            } while (swapped);
        }
    }

    // Our dresses are now stored in a linked list
    const dresses = new LinkedList();

    document.getElementById("dressForm").addEventListener("submit", function (e) {
        e.preventDefault();

        const vendor = document.getElementById("vendor-name").value.trim();
        const name = document.getElementById("dress-name").value.trim();
        const price = document.getElementById("dress-price").value.trim();
        const image = document.getElementById("dress-image").value.trim();

        const dress = { vendor, name, price, image };
        dresses.append(dress);

        updateVendorFilter();
        renderTable(dresses.toArray());

        document.getElementById("dressForm").reset();

        fetch("saveDress", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams(dress)
        }).then(res => {
            if (res.ok) alert("Dress saved successfully!");
            else alert("Failed to save dress.");
        }).catch(err => alert("Error: " + err));
    });

    function renderTable(data) {
        const tableBody = document.querySelector("#dressTable tbody");
        tableBody.innerHTML = "";
        data.forEach(dress => {
            const row = "<tr>" +
                "<td>" + dress.vendor + "</td>" +
                "<td>" + dress.name + "</td>" +
                "<td>$" + parseFloat(dress.price).toFixed(2) + "</td>" +
                "<td><img src='" + dress.image + "' width='60' height='60' /></td>" +
                "</tr>";
            tableBody.insertAdjacentHTML("beforeend", row);
        });
    }

    function sortByPrice() {
        dresses.bubbleSortDescendingByPrice();
        renderTable(dresses.toArray());
    }

    function updateVendorFilter() {
        const filter = document.getElementById("vendorFilter");
        const arr = dresses.toArray();
        const vendors = [...new Set(arr.map(d => d.vendor))];
        filter.innerHTML = "<option value=''>Filter by Vendor</option>";
        vendors.forEach(v => {
            const option = document.createElement("option");
            option.value = v;
            option.textContent = v;
            filter.appendChild(option);
        });
    }

    function filterByVendor() {
        const selected = document.getElementById("vendorFilter").value;
        const arr = dresses.toArray();
        const filtered = selected ? arr.filter(d => d.vendor === selected) : arr;
        renderTable(filtered);
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
