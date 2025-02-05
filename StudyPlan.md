# Rails 7 Study List

## 1. **Rails Basics**

- [x] Install Ruby, Rails, and Database (PostgreSQL, MySQL, etc.)
- [x] Learn Rails Directory Structure
- [x] Understanding MVC (Model-View-Controller)
- [x] Creating a New Rails Application
- [x] Basic CRUD operations (Create, Read, Update, Delete)

## 2. **Rails Models**

- [x] ActiveRecord Basics
- [x] Validations
- [x] Associations (has_many, belongs_to, has_one, etc.)
- [x] Scopes
- [x] Migrations and Schema Changes

## 3. **Rails Views**

- [x] Using Embedded Ruby (ERB) Templates
- [x] Layouts and Partials
- [x] Helper Methods
- [x] Rendering JSON Responses
- [ ] Turbo and Hotwire Basics

## 4. **Rails Controllers**

- [x] Understanding Controllers
- [x] RESTful Routes
- [x] Action Methods (index, show, new, create, edit, update, destroy)
- [x] Redirects and Renders
- [x] Strong Parameters

## 5. **Authentication and Authorization**

- [ ] Implementing User Authentication (Devise or custom solution)
- [x] **JWT Authentication** (Implementing token-based authentication for APIs)
- [ ] Authorization with Pundit or CanCanCan
- [ ] Role-based Access Control (RBAC)

## 6. **Testing**

- [ ] Unit Tests with RSpec or Minitest
- [ ] Request Specs
- [ ] FactoryBot for Test Data
- [ ] Test Coverage with SimpleCov
- [ ] Testing Controllers and Models

## 7. **Rails 7 New Features**

- [ ] **Hotwire**: Turbo + Stimulus for modern, reactive UIs without much JavaScript.
- [ ] **Turbo**: Drive fast page updates via web sockets, AJAX, and partial page refreshes.
- [ ] **Stimulus**: Minimal JavaScript framework integrated with Rails for dynamic interactions.
- [ ] **Async Querying with ActiveRecord**: Async queries allow database queries to run in the background.
- [ ] **Zeitwerk Autoloader**: A faster, more efficient way to load your code automatically.
- [ ] **Multiple Database Support**: Simplified setup for working with multiple databases in one application.
- [ ] **Hotwire for Live Updates**: Easily push live updates from the server to the client.
- [ ] **Improved Error Pages**: More user-friendly error pages in development and production.
- [ ] **Esbuild as the Default JS Compiler**: Faster JavaScript bundling (replaces Webpacker).
- [ ] **ActionText Improvements**: Rich text editor now supports more complex styling and custom embeds.

## 8. **Security**

- [ ] **Cross-Site Scripting (XSS) Protection**: Sanitize input, use `escape` helpers.
- [ ] **Cross-Site Request Forgery (CSRF) Protection**: Rails' default protection mechanism.
- [ ] **SQL Injection Prevention**: Use ActiveRecord queries to prevent direct SQL injection.
- [ ] **Password Hashing**: Use bcrypt for securely storing passwords.
- [ ] **SSL/HTTPS Configuration**: Enforce HTTPS to ensure secure communication.
- [ ] **Content Security Policy (CSP)**: Implement CSP headers to prevent unauthorized resources.
- [ ] **Two-Factor Authentication (2FA)**: Add multi-factor authentication for improved security.
- [ ] **Secure Headers**: Configure headers like HSTS, X-Frame-Options, and X-Content-Type-Options.
- [ ] **API Rate Limiting**: Implement rate limiting to prevent abuse of APIs.
- [ ] **Access Control**: Use Pundit or CanCanCan to manage user permissions.
- [x] **Rack Attack**: Protect against brute-force and denial-of-service (DoS) attacks by rate-limiting requests and blocking malicious traffic.

## 9. **Rails Advanced Topics**

- [ ] Active Job and Background Jobs (Sidekiq)
- [ ] Caching Strategies
- [ ] Rails API Mode
- [ ] WebSockets (ActionCable)
- [ ] Internationalization (I18n)

## 10. **Performance and Deployment**

- [ ] Optimizing SQL Queries with ActiveRecord
- [ ] Database Indexing
- [ ] Caching with Redis and Memcached
- [ ] Deploying to Heroku or another cloud provider
- [ ] Monitoring and Logging

## 11. **Front-End Integration**

- [ ] Using Hotwire (Turbo + Stimulus)
- [ ] Integrating with JavaScript frameworks (React, Vue, etc.)
- [ ] Handling Forms with Stimulus
- [ ] Tailwind CSS or Bootstrap Integration

## 12. **Version Control and Collaboration**

- [x] Git Basics (Clone, Commit, Push, Pull)
- [ ] GitHub Workflow (Pull Requests, Branching)
- [ ] Collaboration with Git

## 13. **Stay Updated**

- [ ] Follow Rails News
- [ ] Read Rails Guides regularly
- [ ] Participate in Rails Communities (Forums, Stack Overflow, etc.)
