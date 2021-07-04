class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :alway
  belongs_to :online

  belongs_to :user

  validates :name, :text,:price,:online_id,presence: true
  has_one_attached :image

  validates :online_id, numericality: { other_than: 1 } 

end
