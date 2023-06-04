class Public::OrdersController < ApplicationController

def new
  @order=current_customer.orders.new
end

def index
  @orders=current_customer.orders
  @order_details=OrderDetail.all
end

def show
  @order=Order.find(params[:id])
  @order_details=OrderDetail.all
end

def confirm
  @cart_items=current_customer.cart_items
  @order=current_customer.orders.new(order_params)   #order_paramsの値が入ったインスタンスを生成する
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
  @order=current_customer.orders.new(order_params)   #order_paramsの値が入ったインスタンスを生成する
  @order.save

  cart_items=current_customer.cart_items
  cart_items.each do |cart_item|
    order_detail=OrderDetail.new
    order_detail.order_id=@order.id
    order_detail.item_id=cart_item.item_id
    order_detail.unit_price=cart_item.item.with_tax_price
    order_detail.amount=cart_item.amount
    order_detail.save!
 end

  cart_items.destroy_all
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


