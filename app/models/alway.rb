class Alway < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Drink' },
    { id: 3, name: 'Food' },
    { id: 4, name: 'Sweets' }
    
  ]

  include ActiveHash::Associations
  has_many :items
  end