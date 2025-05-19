document.addEventListener("turbo:load", function () {
  const existingAlerts = document.querySelectorAll(".alert");
  existingAlerts.forEach((alert) => {
    alert.classList.add("show");
    setTimeout(() => {
      alert.classList.remove("show");
    }, 3000);
  });

  const observer = new MutationObserver((mutations) => {
    mutations.forEach((mutation) => {
      mutation.addedNodes.forEach((node) => {
        if (node.classList && node.classList.contains("alert")) {
          node.classList.add("show");
          setTimeout(() => {
            node.classList.remove("show");
            node.classList.add("hide");
          }, 3000);
        }
      });
    });
  });

  const container = document.querySelector(".container");
  if (container) {
    observer.observe(container, { childList: true });
  } else {
    console.error("No .container element found in the DOM.");
  }
});