class Public::OrdersController < ApplicationController

def new
  @order=Order.new
end

def confirm
  @cart_items=CartItem.all
  @order=Order.new(order_params)   #order_paramsの値が入ったインスタンスを生成する
  # @order_detail=OrderDetail.new(order_detail_params)
  
  # @order.postal_code = current_customer.postal_code
  # @order.address = current_customer.address
  # @order.name = current_customer.first_name + current_customer.last_name
  
  @order.postage=800  #送料
  @order.amount_money=0     #カート内合計金額（each文で、０に足していく）

  render :confirm
  # redirect_to:もう一度ルーティングからやり直して画面表示・・変数の値も消えてしまう
  # render：そのまま画面を移行する・・変数の値そのまま
end

def create
  @order=Order.new(order_params)   #order_paramsの値が入ったインスタンスを生成する
  # @order_detail=OrderDetail.new(order_detail_params)
  @order.save
  
  cart_items=CartItem.all
  order_detail=OrderDetail.new
  order_detail.order_id=@order.id
  order_detail.item_id=cart_items.item_id
  order_detail.unit_price=cart_items.item.with_tax_price
  order_detail.amount=cart_items.amount
  
  order_detail.save
  order_detail.destroy_all
  redirect_to complete_orders_path
end

def complete
end


private
  def order_params
     params.require(:order).permit(:payment_method, :postal_code, :address, :address_name, :amount_money, :postage)
  end
  #order_paramsの各カラムの情報が入ったインスタンスを、新しく生成
  
end


