class Alway < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Drink(coffee)' },
    { id: 3, name: 'Drink(tea)' },
    { id: 4, name: 'Drink(others)' },
    { id: 5, name: 'Food' },
    { id: 6, name: 'Sweets' }

  ]

  include ActiveHash::Associations
  has_many :items
end
