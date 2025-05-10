// Show/Hide password toggle
document.getElementById("togglePassword").addEventListener("click", function () {
    const pwd = document.getElementById("password");
    const icon = this.querySelector("i");
  
    const isHidden = pwd.type === "password";
    pwd.type = isHidden ? "text" : "password";
    icon.classList.toggle("bi-eye", isHidden);
    icon.classList.toggle("bi-eye-slash", !isHidden);
  });
  
  
  // Basic validation
  document.getElementById("loginForm").addEventListener("submit", function (e) {
    const form = e.target;
    if (!form.checkValidity()) {
      e.preventDefault();
      e.stopPropagation();
      form.classList.add("was-validated");
    }
  });

  function changeView() {
    var signInBox = document.getElementById("signInBox");
    var signUpBox = document.getElementById("signUpBox");
  
    signInBox.classList.toggle("d-none");
    signUpBox.classList.toggle("d-none");
  }

  function showPassword3() {
    var pw = document.getElementById("pw");
    var pwi = document.getElementById("pwi");
  
    if (pw.type == "password") {
      pw.type = "text";
      pwicon.className = "bi bi-eye text-white";
    } else {
      pw.type = "password";
      pwicon.className = "bi bi-eye-slash-fill text-white";
    }
  }
  