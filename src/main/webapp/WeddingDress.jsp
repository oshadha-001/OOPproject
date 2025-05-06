<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Wedding Vendor Attire Store</title>
    <link rel="stylesheet" href="CSS/WeddingDress.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Wedding Vendor Attire Store</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button">
                            <button id="userButton" class="btn">Guest</button>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="/WEBSITE/LogInPage/register.html">Edit Profile</a></li>
                            <li><a class="dropdown-item" href="#">Settings & Privacy</a></li>
                            <li><a class="dropdown-item" href="#">Help & Support</a></li>
                            <li><a class="dropdown-item" href="/WEBSITE/LogInPage/login.html">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container">
    <div class="form-group">
        <input type="text" id="vendor-name" placeholder="Vendor Name">
        <input type="text" id="dress-name" placeholder="Dress Name">
        <input type="number" id="dress-price" placeholder="Price" min="0">
        <input type="url" id="dress-image" placeholder="Image URL">
        <button onclick="addDress()">Add Dress</button>
        <select id="filter-vendor" onchange="filterByVendor()">
            <option value="">All Vendors</option>
        </select>
    </div>

    <table>
        <thead>
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Vendor</th>
            <th>Price
                <button onclick="sortByPrice()">Sort</button>
            </th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="product-table"></tbody>
    </table>
</div>

<script>
    let products = [];

    function addDress() {
        let vendor = document.getElementById("vendor-name").value.trim();
        let name = document.getElementById("dress-name").value.trim();
        let price = parseFloat(document.getElementById("dress-price").value);
        let image = document.getElementById("dress-image").value.trim();

        if (!vendor || !name || isNaN(price) || price <= 0 || !image) {
            alert("Please enter valid details for the dress.");
            return;
        }

        products.push({vendor, name, price, image});
        updateVendorFilter();
        document.getElementById("filter-vendor").value = ""; // Reset filter
        displayProducts();

        // Reset input fields
        document.getElementById("vendor-name").value = "";
        document.getElementById("dress-name").value = "";
        document.getElementById("dress-price").value = "";
        document.getElementById("dress-image").value = "";
    }

    function displayProducts() {
        const productTable = document.getElementById("product-table");
        productTable.innerHTML = "";
        const selectedVendor = document.getElementById("filter-vendor").value;

        products.filter(p => !selectedVendor || p.vendor === selectedVendor)
            .forEach(product => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td><img src="${product.image}" alt="Dress" style="width:60px; border-radius:5px;"></td>
                    <td>${product.name}</td>
                    <td>${product.vendor}</td>
                    <td>$${product.price.toFixed(2)}</td>
                    <td><button onclick="deleteDress('${product.name}')">Delete</button></td>
                `;
                productTable.appendChild(row);
            });
    }

    function deleteDress(name) {
        products = products.filter(product => product.name !== name);
        displayProducts();
    }

    function sortByPrice() {
        products.sort((a, b) => a.price - b.price);
        displayProducts();
    }

    function updateVendorFilter() {
        const vendorFilter = document.getElementById("filter-vendor");
        const vendors = [...new Set(products.map(p => p.vendor))];
        vendorFilter.innerHTML = '<option value="">All Vendors</option>' + vendors.map(v =>
            `<option value="${v}">${v}</option>`).join('');
    }

    function filterByVendor() {
        displayProducts();
    }

    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    document.addEventListener("DOMContentLoaded", function () {
        const username = getQueryParam("username");
        const userButton = document.getElementById("userButton");
        if (username && userButton) {
            userButton.textContent = username;
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
