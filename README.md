# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The basic app was created by Lighthouse Labs. What I added:

- bug fixes:
  - basic HTTP authorization for admin security
  - empty cart message
- display:
  - sold-out badge on preview images for sold-out products
- features:
  - users can register, login and logout. Bcrypt is used to validate and hash passwords
- pages:
  - order details page shows the details of the order the user has just made
  - admin dashboard from which admins can:
    - create a new product category
    - create a new product listing
    - delete current product listings

## Images

![Jungle Homepage](https://github.com/eileenlimur/jungle/blob/master/app/assets/images/jungle-main-page.png?raw=true)

![Jungle Cart](https://github.com/eileenlimur/jungle/blob/master/app/assets/images/jungle-shopping-cart.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
