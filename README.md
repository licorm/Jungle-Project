# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product

![products page](https://github.com/licorm/Jungle-Project/blob/master/docs/admin-page.png?raw=true)
![order page](https://github.com/licorm/Jungle-Project/blob/master/docs/order-page.png?raw=true)
![admin page](https://github.com/licorm/Jungle-Project/blob/master/docs/Products-Page.png?raw=true)


## Setup

1. Fork and clone this repository
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Stack

* Rails 4.2 
* PostgreSQL 9.x
* Stripe
* Bcrypt
* capybara
* poltergeist
* database_cleaner
* faker
* RMagick
* JQuery Rails
* PG
