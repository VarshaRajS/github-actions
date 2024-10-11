document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    
    // Simple validation (you can replace this with your own logic)
    if (username === "admin" && password === "password123") {
        alert('Login successful!');
        // Redirect to another page or perform desired actions
    } else {
        document.getElementById('error-message').textContent = "Invalid username or password.";
    }
});
