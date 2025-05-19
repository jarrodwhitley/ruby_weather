# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js"
pin "@popperjs/core", to: "popper.js"

# Controller configuration
pin "controllers"
pin "controllers/application", to: "controllers/application.js"
pin "controllers/index", to: "controllers/index.js"

# Custom JavaScript
pin "custom/twitter", to: "custom/twitter.js"
pin "custom/alerts", to: "custom/alerts.js"
