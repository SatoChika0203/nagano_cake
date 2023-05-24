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
    cart_item=CartItem.find_by(item_id: params[:cart_item][:item_id])
    #CariItemモデルから生成されたインスタンスの中に、cart_itemのitem_idがあるかどうか
    if cart_item.present?
     #cart_itemのitem_idがあるかどうか？
      cart_item.amount += @cart_item.amount.to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      @cart_item=CartItem.all
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
