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
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Wedding Vendor Attire Store</a>
        </div>
    </nav>
</header>

<div class="container mt-4">
    <form id="dressForm">
        <div class="mb-3">
            <input type="text" class="form-control" id="vendor-name" placeholder="Vendor Name" required>
            <input type="text" class="form-control mt-2" id="dress-name" placeholder="Dress Name" required>
            <input type="number" class="form-control mt-2" id="dress-price" placeholder="Price" min="0" required>
            <input type="url" class="form-control mt-2" id="dress-image" placeholder="Image URL" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Dress</button>
    </form>
</div>

<script>
    document.getElementById("dressForm").addEventListener("submit", function (e) {
        e.preventDefault();

        const vendor = document.getElementById("vendor-name").value.trim();
        const name = document.getElementById("dress-name").value.trim();
        const price = document.getElementById("dress-price").value.trim();
        const image = document.getElementById("dress-image").value.trim();

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
