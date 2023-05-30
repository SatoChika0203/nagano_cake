class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  def with_tax_price
    (price * 1.1).floor  #消費税を求めるメソッド
  end
  # floor:端数切り捨
  
  enum is_sales: { true: 0, false: 1 }
  
  
end
