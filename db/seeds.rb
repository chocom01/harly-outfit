# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@users = User.create(
  [
    { name: 'Kolya', email: 'mukola0101@gmail.com', password: '123456', superadmin_role: true },

    { name: 'Ivan', email: 'la0101@gmail.com', password: '123456' }
  ]
)

@products = Product.create(
  [
    { name: 'Dress', price_cents: 500, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Coat', price_cents: 400, sizes: ['M, S'], gender: 0, availability: 2 },

    { name: 'Suit', price_cents: 300, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'T-shirt', price_cents: 150, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Pants', price_cents: 500, sizes: ['M, S'], gender: 0, availability: 2 },

    { name: 'Jacket', price_cents: 400, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Skirt', price_cents: 300, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Dress', price_cents: 500, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Coat', price_cents: 400, sizes: ['M, S'], gender: 0, availability: 2 },

    { name: 'Suit', price_cents: 300, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'T-shirt', price_cents: 150, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Pants', price_cents: 500, sizes: ['M, S'], gender: 0, availability: 2 },

    { name: 'Jacket', price_cents: 400, sizes: ['M, S'], gender: 1, availability: 2 },

    { name: 'Skirt', price_cents: 300, sizes: ['M, S'], gender: 1, availability: 2 }

  ]
)
