# Dinner-Dish-v2
## _The Multivendor Food Ordering System_

### Introduction
In this project we build an online commerce platform for multiple restaurants to facilitate online ordering. You are to build an online ordering system for a restaurant which offers the complete functionality for restaurant customers to order food and restaurant administrators to process and complete those orders. It contain three main users

- Admin (can manage restaurants, items, categories etc)
- User (can order, add item to cart etc)
- Guest (Can view products, restaurants and Items and add them into cart)

## Features

- User can view different restaurant products
- Can view Products by restaurants
- Can view all Item
- Can get delivery from any restaurant (one at a time)

#### Project Objectives

> Plan an arrangement of models which utilize balanced, one-to-many, and many-to-numerous connections
> Practice mixing HTML, CSS, and Rails templates to create an inviting and usable User Interface
> Separate duties between segments of the Rails stack
> Build a logical user-flow that moves across multiple controllers and models

This text you see here is *actually- written in Markdown! To get a feel
for Markdown's syntax, type some text into the left window and
watch the results in the right.

## Tech

Diner DAsh v2.0 uses a number of open source projects to work properly:

- [RubyOnRails] - For handling MVC controller
- [VS Code Editor] - Awesome web-based text editor
- [PG] - PostgreaSql database


### Getting Started

#### Models
- Cart Model: For managing the cart
- Category Items: The Bridge table between the cart and items (one to many)
- Category: For adding category (No Relation with restaurant because only one admin)
- Items: For managing Items (One restaurant have many items)
- Order Detail: To hold the orders details of the users
- Order Items: Hold the details of items ordered by user
- Restaurant: For managing the restaurants
- User: For managing User


#### Installation Steps
- Use Git clone to clone the repository to the local machine
- bundle install
- Use rake db/setup to create db and seed add into it
- Start server using rails s
- Run loaclhost:3000
- Sign up as a customer it will generate email to your verified account confirm it and move towards login.
- View Items and add in cart and place your order and wait for order delivery :)

## License

Devsinc Training Department

   [RubyOnRails]: <https://github.com/rails/rails>
   [VS Code Editor]: <https://code.visualstudio.com/>
   [PG]: <https://www.postgresql.org/docs/13/plpgsql.html/>
