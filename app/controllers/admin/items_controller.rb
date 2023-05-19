class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new()
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_items_path 
      # items一覧（index)にいく
    else
      # @item=Item.new()
      render :new
    end
  end
  
  def index
    @items=Item.all
  end
  
  def show
  end
  
  def edit
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_sales, :image)
  end
end
