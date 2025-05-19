document.addEventListener("DOMContentLoaded", function () {
    const tweetForm = document.getElementById("tweetForm");
    const loginModal = new bootstrap.Modal(document.getElementById("loginModal"));
    const modalTitle = document.getElementById("loginModalTitle");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegisterForm = document.getElementById("showRegisterForm");
    const showLoginForm = document.getElementById("showLoginForm");

    if (showRegisterForm) {
        showRegisterForm.addEventListener("click", function (event) {
        event.preventDefault();
        loginForm.style.display = "none";
        registerForm.style.display = "block";
        modalTitle.innerText = "Register";
        });
    }

    if (showLoginForm) {
        showLoginForm.addEventListener("click", function (event) {
        event.preventDefault();
        registerForm.style.display = "none";
        loginForm.style.display = "block";
        modalTitle.innerText = "Login";
        });
    }

    if (tweetForm) {
        tweetForm.addEventListener("submit", function (event) {
        const isLoggedIn = document.body.dataset.currentUser === "true";

            if (!isLoggedIn) {
                event.preventDefault(); 
                loginModal.show();
            }
        });
    }
});