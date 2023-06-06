class Public::ItemsController < ApplicationController
    before_action :authenticate_customer!, except: [:index]
  def index
    @items=Item.all
    @is_sales=params[:is_sales]
  end
  
  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end
  
  private
  def cart_item_params
     params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
