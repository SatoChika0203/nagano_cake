class Public::OrdersController < ApplicationController

def new
  @order=Order.new
end

def confirm
  @cart_items=CartItem.all
  @order=Order.new(order_params)   #order_paramsの値が入ったインスタンスを生成する
  
  # @order.postal_code = current_customer.postal_code
  # @order.address = current_customer.address
  # @order.name = current_customer.first_name + current_customer.last_name
  
  @order.postage=800  #送料
  @total_amount=0     #カート内合計金額（each文で、０に足していく）

  render :confirm
  # redirect_to:もう一度ルーティングからやり直して画面表示・・変数の値も消えてしまう
  # render：そのまま画面を移行する・・変数の値そのまま
end

def create
  @order=Order.new(order_params)   #order_paramsの値が入ったインスタンスを生成する



  @cart_item=CartItem.find_by(item_id: params[:item_id])
  OrderDetail.save(@cart_item)

  redirect_to complete_orders_path
end

def complete
end


private
  def order_params
     params.require(:order).permit(:payment_method, :postal_code, :address, :name, :amount_money, :postage)
  end
  #order_paramsの各カラムの情報が入ったインスタンスを、新しく生成
end


