<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Wedding Vendor Attire Store</title>
    <link rel="stylesheet" href="CSS/WeddingDress.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background-color: #e0abab;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 18px;
        }

        header {
            background-color: black;
            color: white;
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
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }

        input[type="text"],
        input[type="number"],
        input[type="url"],
        select {
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
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 16px;
        }

        .go-back-btn:hover {
            background-color: #5a6268;
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
                <div class="mb-3">
                    <input type="text" class="form-control mb-2" id="vendor-name" placeholder="Vendor Name" required>
                    <input type="text" class="form-control mb-2" id="dress-name" placeholder="Dress Name" required>
                    <input type="number" class="form-control mb-2" id="dress-price" placeholder="Price" min="0" required>
                    <input type="url" class="form-control mb-2" id="dress-image" placeholder="Image URL" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Dress</button>
            </form>
        </div>
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
    document.getElementById("dressForm").addEventListener("submit", function (e) {
        e.preventDefault();

        const vendor = document.getElementById("vendor-name").value.trim();
        const name = document.getElementById("dress-name").value.trim();
        const price = document.getElementById("dress-price").value.trim();
        const image = document.getElementById("dress-image").value.trim();

        const rowTemplate = `<tr>
                                <td>\${vendor}</td>
                                <td>\${name}</td>
                                <td>$\${parseFloat(price).toFixed(2)}</td>
                                <td><img src="\${image}" width="60" height="60" /></td>
                             </tr>`;

        const finalRow = eval('`' + rowTemplate + '`');
        document.querySelector("#dressTable tbody").insertAdjacentHTML("beforeend", finalRow);

        fetch("saveDress", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({
                vendor: vendor,
                name: name,
                price: price,
                image: image
            })
        }).then(res => {
            if (res.ok) {
                alert("Dress saved successfully!");
                document.getElementById("dressForm").reset();
            } else {
                alert("Failed to save dress.");
            }
        }).catch(err => {
            alert("Error: " + err);
        });
    });
</script>
<form action="vendorLogin.jsp" method="post"></form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
