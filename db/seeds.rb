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
    { name: 'size', presentation: 'Outerwear size' },

    { name: 'size', presentation: 'Shoes size' },

    { name: 'color', presentation: 'Color' }
  ]
)
OptionType.first.option_values.create(
  [
    { name: 'size', presentation: 'M' },
    { name: 'size', presentation: 'L' },
    { name: 'size', presentation: 'S' }
  ]
)
OptionType.second.option_values.create(
  [
    { name: 'size', presentation: '41' },
    { name: 'size', presentation: '42' },
    { name: 'size', presentation: '43' }
  ]
)
OptionType.third.option_values.create(
  [
    { name: 'color', presentation: 'Red' },
    { name: 'color', presentation: 'Black' },
    { name: 'color', presentation: 'White' }
  ]
)
OptionType.find_by(id: 1).products.create(
  [
    { name: 'Hoody', price_cents: 500 }
  ]
)

OptionType.find_by(id: 2).products.create(
  [
    { name: 'Sneakers', price_cents: 400 }
  ]
)
OptionType.find_by(id: 3).products << (Product.find_by(name: 'Hoody'))
OptionType.find_by(id: 3).products << (Product.find_by(name: 'Sneakers'))

# HOODY
Variant.create(product_id: 1, availability: 6)
Variant.find_by(id: 1).option_values << (OptionValue.find_by(presentation: 'M'))
Variant.find_by(id: 1).option_values << (OptionValue.find_by(presentation: 'Black'))

Variant.create(product_id: 1, availability: 6)
Variant.find_by(id: 2).option_values << (OptionValue.find_by(presentation: 'S'))
Variant.find_by(id: 2).option_values << (OptionValue.find_by(presentation: 'Red'))

Variant.create(product_id: 1, availability: 6)
Variant.find_by(id: 3).option_values << (OptionValue.find_by(presentation: 'S'))
Variant.find_by(id: 3).option_values << (OptionValue.find_by(presentation: 'White'))
# SNEAKERS
Variant.create(product_id: 2, availability: 6)
Variant.find_by(id: 4).option_values << (OptionValue.find_by(presentation: '41'))
Variant.find_by(id: 4).option_values << (OptionValue.find_by(presentation: 'White'))
