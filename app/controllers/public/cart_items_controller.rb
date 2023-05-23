class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def update
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items=CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item=Item.find(params[:cart_item][:item_id])
      # cart_itemのitem_id
      render 'public/items/show'
    end
  end

private
  def cart_item_params
     params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
