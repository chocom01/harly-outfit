# frozen_string_literal: true

@users = User.create(
  [
    { name: 'Kolya', email: 'mukola0101@gmail.com', password: '123456',
      superadmin_role: true },

    { name: 'Ivan', email: 'la0101@gmail.com', password: '123456' }
  ]
)

OptionType.create(
  [
    { name: 'Outerwear size' },

    { name: 'Color' },

    { name: 'Shoes size' }
  ]
)
OptionType.first.option_values.create(
  [
    { name: 'M' },
    { name: 'L' },
    { name: 'S' }
  ]
)
OptionType.second.option_values.create(
  [
    { name: 'Red' },
    { name: 'Black' },
    { name: 'White' }
  ]
)
OptionType.third.option_values.create(
  [
    { name: '41' },
    { name: '42' },
    { name: '43' }
  ]
)
@products = OptionType.first.products.create(
  [
    { name: 'Hoody', price_cents: 500 },

    { name: 'Sneakers', price_cents: 400 }

    # { name: 'T-shirt', price_cents: 150 },

    # { name: 'Jacket', price_cents: 400 },

    # { name: 'Suit', price_cents: 300 },

    # { name: 'Pants', price_cents: 500 },

    # { name: 'Skirt', price_cents: 300 },

    # { name: 'Skirt', price_cents: 300 }

  ]
)

# HOODY
Variant.create(product_id: 1, availability: 6)
Variant.find_by(id: 1).option_values << (OptionValue.find_by(name: 'M'))
Variant.find_by(id: 1).option_values << (OptionValue.find_by(name: 'Black'))
# SNEAKERS
Variant.create(product_id: 2, availability: 6)
Variant.find_by(id: 2).option_values << (OptionValue.find_by(name: '41'))
Variant.find_by(id: 2).option_values << (OptionValue.find_by(name: 'White'))
