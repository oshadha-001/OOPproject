<script type="text/javascript">
        var gk_isXlsx = false;
        var gk_xlsxFileLookup = {};
        var gk_fileData = {};
        function filledCell(cell) {
          return cell !== '' && cell != null;
        }
        function loadFileData(filename) {
        if (gk_isXlsx && gk_xlsxFileLookup[filename]) {
            try {
                var workbook = XLSX.read(gk_fileData[filename], { type: 'base64' });
                var firstSheetName = workbook.SheetNames[0];
                var worksheet = workbook.Sheets[firstSheetName];

                // Convert sheet to JSON to filter blank rows
                var jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1, blankrows: false, defval: '' });
                // Filter out blank rows (rows where all cells are empty, null, or undefined)
                var filteredData = jsonData.filter(row => row.some(filledCell));

                // Heuristic to find the header row by ignoring rows with fewer filled cells than the next row
                var headerRowIndex = filteredData.findIndex((row, index) =>
                  row.filter(filledCell).length >= filteredData[index + 1]?.filter(filledCell).length
                );
                // Fallback
                if (headerRowIndex === -1 || headerRowIndex > 25) {
                  headerRowIndex = 0;
                }

                // Convert filtered JSON back to CSV
                var csv = XLSX.utils.aoa_to_sheet(filteredData.slice(headerRowIndex)); // Create a new sheet from filtered array of arrays
                csv = XLSX.utils.sheet_to_csv(csv, { header: 1 });
                return csv;
            } catch (e) {
                console.error(e);
                return "";
            }
        }
        return gk_fileData[filename] || "";
        }
        </script><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.booking.model.Service, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buyer Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
        <a href="LogoutServlet">Logout</a>
        
        <!-- Search Form -->
        <h3>Search Services</h3>
        <form action="SearchServlet" method="get">
            <label for="service_type">Service Type:</label>
            <input type="text" id="service_type" name="service_type">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date">
            <input type="submit" value="Search">
        </form>
        
        <!-- Available Services -->
        <h3>Available Services</h3>
        <table border="1">
            <tr>
                <th>Service Name</th>
                <th>Type</th>
                <th>Date</th>
                <th>Slots</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <% 
                List<Service> services = (List<Service>) request.getAttribute("services");
                if (services != null) {
                    for (Service service : services) {
            %>
            <tr>
                <td><%= service.getServiceName() %></td>
                <td><%= service.getServiceType() %></td>
                <td><%= service.getAvailableDate() %></td>
                <td><%= service.getAvailableSlots() %></td>
                <td><%= service.getPrice() %></td>
                <td>
                    <form action="BookingServlet" method="post">
                        <input type="hidden" name="service_id" value="<%= service.getServiceId() %>">
                        <input type="submit" value="Book Now">
                    </form>
                </td>
            </tr>
            <% 
                    }
                }
            %>
        </table>
        
        <!-- Booking History -->
        <h3>Your Bookings</h3>
        <table border="1">
            <tr>
                <th>Booking ID</th>
                <th>Service Name</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            <% 
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null) {
                    for (Booking booking : bookings) {
            %>
            <tr>
                <td><%= booking.getBookingId() %></td>
                <td><%= booking.getServiceName() %></td>
                <td><%= booking.getBookingDate() %></td>
                <td><%= booking.getStatus() %></td>
            </tr>
            <% 
                    }
                }
            %>
        </table>
    </div>
</body>
</html>