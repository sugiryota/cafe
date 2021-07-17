class PaysController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @pay_address = PayAddress.new
  end

  def create
    @pay_address = PayAddress.new(pay_params)
    if @pay_address.valid?
      pay_item
      @pay_address.save
      return redirect_to root_path
    else
    
      render :index
    end
  end
  private

  def pay_params
    
    params.require(:pay_address).permit(:name,:kana_name,:address, :postal_code, :prefecture_id, :city, :phone_number, :building_name).merge(
      item_id: params[:id], token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: pay_params[:token],
      currency: 'jpy'
    )
  end
end
