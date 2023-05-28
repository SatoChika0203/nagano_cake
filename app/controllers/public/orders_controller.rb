class Public::OrdersController < ApplicationController

def new
  @order=Order.new
end

def confirm
  @payment_method=params[:order][:payment_method]
  @address=params[:order][:address]
  render :confirm
  # redirect_to:もう一度ルーティングからやり直して画面表示・・変数の値も消えてしまう
  # render：そのまま画面を移行する・・変数の値そのまま
end

def create
end


private
  def order_params
     params.require(:order).permit(:payment_method, :address)
  end
  #order_paramsの各カラムの情報が入ったインスタンスを、新しく生成
end


