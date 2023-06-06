class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
    @order_details= OrderDetail.all
  end
  
  def about
  end
end
