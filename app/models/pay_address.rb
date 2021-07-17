class PayAddress
  include ActiveModel::Model
  attr_accessor :name,:kana_name ,:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :token

  with_options presence: true do
    validates :name
    validates :kana_name
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :item_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    pay = Pay.create(item_id: item_id)

    Address.create(name: name, kana_name: kana_name,postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, pay_id: pay.id)
  end
end