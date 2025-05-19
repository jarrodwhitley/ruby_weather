document.addEventListener("DOMContentLoaded", function () {
    const tweetForm = document.getElementById("tweetForm");
    const loginModal = document.getElementById("loginModal");
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
            const isLoggedIn = document.body.getAttribute("data-current-user") === "true";

            if (!isLoggedIn) {
                event.preventDefault(); 
                const bsModal = new bootstrap.Modal(loginModal);
                bsModal.show();

                const messageElement = document.createElement("div");
                messageElement.className = "login-message alert-info";
                messageElement.textContent = "Please log in to post a tweet";
                loginModal.querySelector(".modal-body").prepend(messageElement);

                loginModal.addEventListener("hidden.bs.modal", function () {
                    messageElement.remove();
                }, { once: true });
            }
        });
    }
});