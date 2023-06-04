class Admin::HomesController < ApplicationController
  def top
    @order_details= OrderDetail.all
    # @order=Order.find(params[:id])
  end
  
  def about
  end
end
