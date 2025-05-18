document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.login-box');
    const vendorIdInput = document.querySelector('#vendorId');
    const passwordInput = document.querySelector('#password');
    const errorMessage = document.querySelector('.error-message');

    // Display server-side error message as a popup, if present
    if (errorMessage) {
        showPopup('Error', errorMessage.textContent.trim(), 'error');
    }

    // Handle form submission
    form.addEventListener('submit', function(event) {
        const vendorId = vendorIdInput.value.trim();
        const password = passwordInput.value.trim();

        // Client-side validation
        if (!vendorId || !password) {
            event.preventDefault();
            showPopup('Error', 'Vendor ID and Password must not be empty.', 'error');
            return;
        }
    });

    // Function to display popup
    function showPopup(title, message, type) {
        const popup = document.createElement('div');
        popup.className = `popup ${type}`;
        popup.innerHTML = `
            <div class="popup-content">
                <h3>${title}</h3>
                <p>${message}</p>
                <button onclick="this.parentElement.parentElement.remove()">Close</button>
            </div>
        `;

        // Add popup styles
        const style = document.createElement('style');
        style.textContent = `
            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 1000;
                animation: fadeIn 0.3s ease-in-out;
            }
            .popup-content {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                text-align: center;
                min-width: 300px;
            }
            .popup.error .popup-content {
                border-left: 5px solid #dc3545;
            }
            .popup.success .popup-content {
                border-left: 5px solid #28a745;
            }
            .popup-content h3 {
                margin: 0 0 10px;
                color: #333;
            }
            .popup-content p {
                margin: 0 0 15px;
                color: #555;
            }
            .popup-content button {
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                background: #007bff;
                color: #fff;
                transition: background 0.2s;
            }
            .popup-content button:hover {
                background: #0056b3;
            }
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
        `;

        document.head.appendChild(style);
        document.body.appendChild(popup);

        // Auto-close after 5 seconds
        setTimeout(() => {
            popup.remove();
        }, 5000);
    }
});