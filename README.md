# README

# Rales Engine
In this project I used Rails and ActiveRecord to build a JSON API that spits out the data from the schema. 

## System Requirements:
* Ruby version: 5.1.7
* PostgreSQL
* Ruby 2.4.1

## Gems Used
* RSpec-rails
* Capybara
* Factory_bot_rails
* Shoulda-matchers
* Simplecov
* Pry
* Fast_jsonapi

## Setup
  - rake import_csv:import_1_customers
  - rake import_csv:import_2_merchants 
  - rake import_csv:import_3_items
  - rake import_csv:import_4_invoices
  - rake import_csv:import_5_invoice_items
  - rake import_csv:import_6_transactions
  - rake import_csv:all 
## Testing suite
  - rspec
