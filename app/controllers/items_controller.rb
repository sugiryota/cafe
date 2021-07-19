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
    @January = Item.where(category_id: '2', online_id: '3')
    @febrary = Item.where(category_id: '3', online_id: '3')
    @march = Item.where(category_id: '4', online_id: '3')
    @april = Item.where(category_id: '5', online_id: '3')
    @may = Item.where(category_id: '6', online_id: '3')
    @June = Item.where(category_id: '7', online_id: '3')
    @July = Item.where(category_id: '8', online_id: '3')
    @auguest = Item.where(category_id: '9', online_id: '3')
    @september = Item.where(category_id: '10', online_id: '3')
    @octorber = Item.where(category_id: '11', online_id: '3')
    @november = Item.where(category_id: '12', online_id: '3')
    @december = Item.where(category_id: '12', online_id: '3')
    @month = params[:category_id]
  end

  def all_month

  end

  def online
    @online = Item.where( online_id: '2')
 
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
                                 :online_id)
  end
end
