class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  def subtotal
    unit_price * amount  #小計を求めるメソッド
  end
end
