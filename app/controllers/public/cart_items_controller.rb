class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items=current_customer.cart_items

  end

  def update
    @cart_item=CartItem.find(params[:id])
    # cart_item=CartItem.find_by(item_id: params[:item_id])
    # if cart_item.present?
      @cart_item.amount = params[:amount].to_i
      @cart_item.save
      redirect_to cart_items_path
    # else
    #   render 'public/items/show'
    # end
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items=current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

def create
    @cart_item=current_customer.cart_items.new(cart_item_params)
    cart_item=current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #CariItemモデルから生成されたインスタンスの中に、cart_itemのitem_idがあるかどうか
    if cart_item.present?
     #cart_itemのitem_idがあるかどうか？
      cart_item.amount += @cart_item.amount.to_i
      cart_item.save!
      redirect_to cart_items_path
    elsif @cart_item.save!
      @cart_item=current_customer.cart_items
      redirect_to cart_items_path
    else
      render 'public/items/show'
    end
end



private
  def cart_item_params
     params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
