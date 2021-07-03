class ItemsController < ApplicationController

  def index
    @items = Item.where(category_id: '2')
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
    params.require(:item).permit(:name,:text,:category_id,:price,:image).merge(user_id: current_user.id)
  end

end
