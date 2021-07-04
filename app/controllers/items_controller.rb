class ItemsController < ApplicationController

  def index
    
  end
  def alway
    @drink = Item.where(alway_id: '2')
    @food = Item.where(alway_id: '3')
    @sweets = Item.where(alway_id: '4')
    @alway = params[:alway_id]
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
    params.require(:item).permit(:name,:text,:category_id,:price,:image,:alway_id,:online_id).merge(user_id: current_user.id)
  end

end
