class Admin::OrdersController < ApplicationController
  
  def show
    @order=Order.find(params[:id])
    @order_detail=OrderDetail.all
  end


end
