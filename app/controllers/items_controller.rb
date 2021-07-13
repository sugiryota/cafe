class ItemsController < ApplicationController
  require 'date'
  def index
    day = Date.today
    @dayy = day.month
  end

  def alway
    @coffee = Item.where(alway_id: '2', online_id: '3')
    @tea = Item.where(alway_id: '3', online_id: '3')
    @others = Item.where(alway_id: '4', online_id: '3')
    @food = Item.where(alway_id: '5', online_id: '3')
    @desert = Item.where(alway_id: '6', online_id: '3')
    @alway = params[:alway_id]
  end

  def month
    @July = Item.where(category_id: '8', online_id: '3')
    @month = params[:category_id]
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new

    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :price, :image, :alway_id,
                                 :online_id).merge(user_id: current_user.id)
  end
end
