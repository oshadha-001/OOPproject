function handleLogin() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    if (!email || !password) {
        alert('Please fill in all fields');
        return;
    }

    fetch('/OOPproject/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({ email, password })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                window.location.href = '/OOPproject/dashboard.html'; // Adjust as needed
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred during login');
        });
}

function handleRegister() {
    const names = document.getElementById('names').value;
    const surnames = document.getElementById('surnames').value;
    const email = document.getElementById('emailCreate').value;
    const password = document.getElementById('passwordCreate').value;

    if (!names || !surnames || !email || !password) {
        alert('Please fill in all fields');
        return;
    }

    fetch('/OOPproject/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({ names, surnames, email, password })
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
                document.getElementById('loginAccessRegister').classList.remove('active');
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('An error occurred during registration');
        });
}
