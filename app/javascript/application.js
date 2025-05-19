// Entry point for the esbuild bundle
import "@hotwired/turbo-rails"
import "./controllers"
import React from "react"
import { createRoot } from "react-dom/client"

// Make React available globally
window.React = React
window.createRoot = createRoot

// Import the AuthModal component
import "./components/AuthModal"