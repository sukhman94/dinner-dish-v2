# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat1 = Category.create(name: 'Fast food')
Cat2 = Category.create(name: 'Chinese')
Cat3 = Category.create(name: 'Continental')
Cat4 = Category.create(name: 'Italian')
Cat5 = Category.create(name: 'Pakistani')

User1 = User.create(email: 'demo+rachel@jumpstartlab.com', full_name: 'Rachel Warbelow', password: 'password',
                    password_confirmation: 'password', role: 'user')
User1.skip_confirmation!
User1.save
User2 = User.create(email: 'demo+jeff@jumpstartlab.com', full_name: 'Jeff Casimir', display_name: 'j3',
                    password: 'password', password_confirmation: 'password', role: 'user')
User2.skip_confirmation!
User2.save
User3 = User.create(email: 'demo+jorge@jumpstartlab.com', full_name: 'Jorge Tellez', display_name: 'novohispano',
                    password: 'password', password_confirmation: 'password', role: 'user')
User3.skip_confirmation!
User3.save
User4 = User.create(email: 'demo+josh@jumpstartlab.com', full_name: 'Josh Cheek', display_name: 'josh',
                    password: 'password', password_confirmation: 'password', role: 'admin')
User4.skip_confirmation!
User4.save

Restaurant1 = Restaurant.create(name: 'Restaurant1', description: 'Description 1')
Restaurant2 = Restaurant.create(name: 'Restaurant2', description: 'Description 2')
Restaurant3 = Restaurant.create(name: 'Restaurant3', description: 'Description 3')
Restaurant4 = Restaurant.create(name: 'Restaurant4', description: 'Description 4')
Restaurant5 = Restaurant.create(name: 'Restaurant5', description: 'Description 5')

Item1 = Item.create(title: 'Pizza', description: 'This is pizza', price: 850, status: 'show',
                    category_ids: [Cat1.id, Cat4.id], restaurant_id: Restaurant1.id)
Item2 = Item.create(title: 'Burger1', description: 'This is Burger1', price: 480, status: 'show',
                    category_ids: [Cat1.id], restaurant_id: Restaurant1.id)
Item3 = Item.create(title: 'Burger2', description: 'This is Burger2', price: 560, status: 'show',
                    category_ids: [Cat1.id], restaurant_id: Restaurant1.id)
Item4 = Item.create(title: 'Chicken Karahi', description: 'Pakistani chicken karahi', price: 900, status: 'show',
                    category_ids: [Cat5.id], restaurant_id: Restaurant1.id)
Item5 = Item.create(title: 'Manchurian', description: 'Chinese special', price: 350, status: 'show',
                    category_ids: [Cat2.id], restaurant_id: Restaurant1.id)
Item6 = Item.create(title: 'Noodles', description: 'Chinese most favourite', price: 180, status: 'show',
                    category_ids: [Cat2.id], restaurant_id: Restaurant2.id)
Item7 = Item.create(title: 'Biryani', description: 'Special chicken biryani', price: 250, status: 'show',
                    category_ids: [Cat5.id], restaurant_id: Restaurant2.id)
Item8 = Item.create(title: 'Prawns', description: 'Continental', price: 2500, status: 'show',
                    category_ids: [Cat2.id, Cat3.id], restaurant_id: Restaurant2.id)
Item9 = Item.create(title: 'Sweet Potato Pie', description: 'Continental', price: 1500, status: 'show',
                    category_ids: [Cat3.id], restaurant_id: Restaurant2.id)
Item10 = Item.create(title: 'Chicken And Cheese Salad.', description: 'Continental', price: 1800, status: 'show',
                     category_ids: [Cat3.id], restaurant_id: Restaurant2.id)
Item11 = Item.create(title: 'Margherita Pizza', description: 'Italian style pizza', price: 1150, status: 'show',
                     category_ids: [Cat4.id], restaurant_id: Restaurant3.id)
Item12 = Item.create(title: 'Pasta Carbonara.', description: 'Italian special', price: 960, status: 'show',
                     category_ids: [Cat4.id], restaurant_id: Restaurant3.id)
Item13 = Item.create(title: 'Chow Mein', description: 'Chinese', price: 280, status: 'show',
                     category_ids: [Cat2.id], restaurant_id: Restaurant3.id)
Item14 = Item.create(title: 'Kung Pao Chicken', description: 'Served with fried rice', price: 280, status: 'show',
                     category_ids: [Cat2.id], restaurant_id: Restaurant3.id)
Item15 = Item.create(title: 'Dumplings', description: 'Chinese', price: 120, status: 'show',
                     category_ids: [Cat1.id, Cat4.id], restaurant_id: Restaurant4.id)
Item16 = Item.create(title: 'Nihari', description: 'Pakistans most favourite', price: 450, status: 'show',
                     category_ids: [Cat2.id], restaurant_id: Restaurant4.id)
Item17 = Item.create(title: 'Halwa Puri.', description: 'Breakfast', price: 120, status: 'show',
                     category_ids: [Cat1.id, Cat4.id], restaurant_id: Restaurant4.id)
Item18 = Item.create(title: 'Saag', description: 'Punjabi Special', price: 250, status: 'show',
                     category_ids: [Cat5.id], restaurant_id: Restaurant5.id)
Item19 = Item.create(title: 'Lassi', description: 'This is pizza', price: 850, status: 'show',
                     category_ids: [Cat5.id], restaurant_id: Restaurant5.id)
@order1 = OrderDetail.create(user_id: User1.id, phone: '92003212154', status: 'ordered', grand_total: 850,
                             address: 'Dha phase 1 Lahore')
@order2 = OrderDetail.create(user_id: User1.id, phone: '92003212154', status: 'ordered', grand_total: 480,
                             address: 'Dha phase 1 Lahore')
@order3 = OrderDetail.create(user_id: User2.id, phone: '92003212154', status: 'paid', grand_total: 560,
                             address: 'Dha phase 1 Lahore')
@order4 = OrderDetail.create(user_id: User2.id, phone: '92003212154', status: 'paid', grand_total: 900,
                             address: 'Dha phase 1 Lahore')
@order5 = OrderDetail.create(user_id: User3.id, phone: '92003212154', status: 'cancelled', grand_total: 350,
                             address: 'Dha phase 1 Lahore')
@order6 = OrderDetail.create(user_id: User3.id, phone: '92003212154', status: 'cancelled', grand_total: 180,
                             address: 'Dha phase 1 Lahore')
@order7 = OrderDetail.create(user_id: User3.id, phone: '92003212154', status: 'ordered', grand_total: 250,
                             address: 'Dha phase 1 Lahore')
@order8 = OrderDetail.create(user_id: User1.id, phone: '92003212154', status: 'completed', grand_total: 2500,
                             address: 'Dha phase 1 Lahore')
@order9 = OrderDetail.create(user_id: User2.id, phone: '92003212154', status: 'completed', grand_total: 1500,
                             address: 'Dha phase 1 Lahore')
@order10 = OrderDetail.create(user_id: User2.id, phone: '92003212154', status: 'cancelled', grand_total: 1800,
                              address: 'Dha phase 1 Lahore')
OrderItem.create(order_detail_id: @order1.id, item_id: Item1.id, quantity: 1, price: Item1.price)
OrderItem.create(order_detail_id: @order2.id, item_id: Item2.id, quantity: 1, price: Item2.price)
OrderItem.create(order_detail_id: @order3.id, item_id: Item3.id, quantity: 1, price: Item3.price)
OrderItem.create(order_detail_id: @order4.id, item_id: Item4.id, quantity: 1, price: Item4.price)
OrderItem.create(order_detail_id: @order5.id, item_id: Item5.id, quantity: 1, price: Item5.price)
OrderItem.create(order_detail_id: @order6.id, item_id: Item6.id, quantity: 1, price: Item6.price)
OrderItem.create(order_detail_id: @order7.id, item_id: Item7.id, quantity: 1, price: Item7.price)
OrderItem.create(order_detail_id: @order8.id, item_id: Item8.id, quantity: 1, price: Item8.price)
OrderItem.create(order_detail_id: @order9.id, item_id: Item9.id, quantity: 1, price: Item9.price)
OrderItem.create(order_detail_id: @order10.id, item_id: Item10.id, quantity: 1, price: Item10.price)
