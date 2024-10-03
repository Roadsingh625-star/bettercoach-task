<!-- # README

# Coaching App

## Description

The Coaching App is a Ruby on Rails application designed to manage coaching programs, users, and administrative functionalities. Users can enroll in programs, view details about coaches, and manage their accounts. Admins have access to manage users and view analytics.

## Ruby Version

 Ruby 3.0.0
 Rails 7.1.4

## System Dependencies

- PostgreSQL for database management.
- Node.js and Yarn for JavaScript and CSS bundling.

## Configuration

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your_username/coaching_app.git
   cd coaching_app

# Install dependencies:
  bundle install

# Setup environment variables:
  Create a .env file in the root of the project and add your environment variables:
    ADMIN_EMAIL=admin@example.com
    ADMIN_PASSWORD=password
    TEST_DATABASE_NAME=better_coach_test
    DEV_DATABASE_NAME=better_coach_development
    DATABASE_USERNAME=your_postgres_username
    DATABASE_PASSWORD=your_postgres_password

# Create the database:
  rails db:create
  rails db:migrate

# Database Initialization:
  # On macOS
brew services start postgresql
# On Linux
sudo service postgresql start

# Run Test Cases
  bundle exec rspec

# Additional Notes:
The application uses the following gems:
devise for user authentication.
rails_admin for the admin panel.
will_paginate for pagination.
bootstrap for styling.
dotenv-rails for environment variable management.
  

* ... -->
