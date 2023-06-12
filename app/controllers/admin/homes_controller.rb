class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
    # @order_details= OrderDetail.all
    @orders=Order.all
    # @order_detail=OrderDetail.find_by(order_id: params[:order_id])
    # @total_amount=0
  end
  
  def about
  end
end
