<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="AdminManagement.User" %>
<%@ page import="VendorManagement.Vendor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard | WedConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: pink;
        }

        header {
            background-color: #333;
            color: white;
            padding: 20px 0;
        }

        header h1 {
            text-align: center;
            margin: 0;
        }

        nav {
            text-align: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }

        .dashboard-section {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ccc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        button {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }

        .btn-danger {
            background-color: #ff4444;
            color: white;
            border: none;
        }

        .btn-danger:hover {
            background-color: #cc0000;
        }

        .btn-warning {
            background-color: #ffbb33;
            color: black;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        footer {
            text-align: center;
            padding: 15px;
            margin-top: 30px;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>

<header>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <nav>
            <a href="#users">Users</a>
            <a href="#vendors">Vendors</a>
            <a href="#products">Products</a>
            <a href="login.html">Logout</a>
        </nav>
    </div>
</header>

<main class="container">

    <!-- Users Section -->
    <section id="users" class="dashboard-section">
        <h3>Manage Users</h3>
        <table>
            <thead>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<User> users = (List<User>) session.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (int i = 0; i < users.size(); i++) {
                        User user = users.get(i);
                        String username = user.getUsername();
                        String email = user.getEmail() != null ? user.getEmail() : "-";
                        String password = user.getPassword();
            %>
            <tr>
                <td><%= username %></td>
                <td><%= email %></td>
                <td>
                    <button class="btn-danger btn-sm" onclick="deleteUser(<%= i %>)">Delete</button>
                    <button class="btn-warning btn-sm" onclick="editUser(<%= i %>, '<%= username %>', '<%= email %>', '<%= password %>')">Edit</button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3">No users available.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <button class="btn-primary" onclick="downloadUserDetails()">Download User Details</button>
    </section>

    <!-- Vendors Section -->
    <section id="vendors" class="dashboard-section">
        <h3>Manage Vendors</h3>
        <table>
            <thead>
            <tr>
                <th>Vendor ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Vendor> vendors = (List<Vendor>) session.getAttribute("vendors");
                if (vendors != null && !vendors.isEmpty()) {
                    for (int i = 0; i < vendors.size(); i++) {
                        Vendor vendor = vendors.get(i);
                        String vendorId = vendor.getVendorId();
                        String name = vendor.getName();
                        String password = vendor.getPassword();
            %>
            <tr>
                <td><%= vendorId %></td>
                <td><%= name %></td>
                <td>
                    <button class="btn-danger btn-sm" onclick="deleteVendor(<%= i %>)">Delete</button>
                    <button class="btn-warning btn-sm" onclick="editVendor(<%= i %>, '<%= vendorId %>', '<%= name %>', '<%= password %>')">Edit</button>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3">No vendors available.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <button class="btn-primary" onclick="downloadVendorDetails()">Download Vendor Details</button>
    </section>

    <!-- Products Section -->
    <section id="products" class="dashboard-section">
        <h3>Manage Products</h3>
        <p>No products available yet (awaiting dresses.txt).</p>
    </section>

</main>

<footer>
    <p>© 2025 WedConnect. All rights reserved.</p>
</footer>

<script>
    function deleteUser(index) {
        if (confirm('Are you sure you want to delete this user?')) {
            fetch('/deleteUser', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'index=' + encodeURIComponent(index)
            })
                .then(response => {
                    if (response.ok) {
                        alert('User deleted successfully.');
                        window.location.reload();
                    } else {
                        alert('Failed to delete user.');
                    }
                })
                .catch(error => {
                    console.error('Error deleting user:', error);
                    alert('An error occurred. Please try again.');
                });
        }
    }

    function editUser(index, username, email, password) {
        window.location.href = '/updateUserForm?index=' + index + '&username=' + encodeURIComponent(username) +
            '&email=' + encodeURIComponent(email || '') + '&password=' + encodeURIComponent(password);
    }

    function deleteVendor(index) {
        if (confirm('Are you sure you want to delete this vendor?')) {
            fetch('/deleteVendor', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'index=' + encodeURIComponent(index)
            })
                .then(response => {
                    if (response.ok) {
                        alert('Vendor deleted successfully.');
                        window.location.reload();
                    } else {
                        alert('Failed to delete vendor.');
                    }
                })
                .catch(error => {
                    console.error('Error deleting vendor:', error);
                    alert('An error occurred. Please try again.');
                });
        }
    }

    function editVendor(index, vendorId, name, password) {
        window.location.href = '/updateVendorForm?index=' + index + '&vendorId=' + encodeURIComponent(vendorId) +
            '&name=' + encodeURIComponent(name) + '&password=' + encodeURIComponent(password);
    }

    function downloadUserDetails() {
        window.location.href = '/download';
    }

    function downloadVendorDetails() {
        window.location.href = '/downloadVendors';
    }
</script>

</body>
</html>