class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user

  validates :name, :text,:price,presence: true
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 } 

end
