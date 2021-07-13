class Online < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'online' },
    { id: 3, name: 'real' }

  ]

  include ActiveHash::Associations
  has_many :items
end
