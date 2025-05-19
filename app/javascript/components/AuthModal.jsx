import React, { useState, useEffect } from "react";
import { createRoot } from "react-dom/client";

const AuthModal = () => {
  const [showLogin, setShowLogin] = useState(true);
  
  const toggleForm = () => {
    setShowLogin(!showLogin);
    
    // Update modal title
    const modalTitle = document.getElementById("loginModalTitle");
    if (modalTitle) {
      modalTitle.textContent = showLogin ? "Create Account" : "Login";
    }
  };
  
  // Inject Rails form content after React renders
  useEffect(() => {
    const loginTemplate = document.getElementById("login_form_template");
    const registerTemplate = document.getElementById("register_form_template");
    
    if (loginTemplate && document.getElementById("login_container")) {
      document.getElementById("login_container").innerHTML = loginTemplate.innerHTML;
    }
    
    if (registerTemplate && document.getElementById("register_container")) {
      document.getElementById("register_container").innerHTML = registerTemplate.innerHTML;
    }
  }, []);
  
  return (
    <>
      {/* Login Form */}
      <div style={{ display: showLogin ? "block" : "none" }}>
        <div id="login_container"></div>
        <p className="mt-3">
          Don't have an account?{" "}
          <button 
            onClick={toggleForm} 
            className="btn btn-link p-0"
            style={{ textDecoration: "none" }}
          >
            Create account
          </button>
        </p>
      </div>
      
      {/* Register Form */}
      <div style={{ display: showLogin ? "none" : "block" }}>
        <div id="register_container"></div>
        <p className="mt-3">
          Already have an account?{" "}
          <button 
            onClick={toggleForm} 
            className="btn btn-link p-0"
            style={{ textDecoration: "none" }}
          >
            Login
          </button>
        </p>
      </div>
    </>
  );
};

// Initialize when DOM is loaded
document.addEventListener("DOMContentLoaded", () => {
  const modalBodyElement = document.querySelector("#loginModal .modal-body");
  if (modalBodyElement) {
    const root = createRoot(modalBodyElement);
    root.render(<AuthModal />);
  }
});

export default AuthModal;