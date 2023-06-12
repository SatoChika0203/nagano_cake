class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  # 0 が入っている場合は credit_card(クレジットカード)
  # 1 が入ってる場合は transfer(銀行振込)

 def order_amount
   amount = 0
   order_details.each do |order_detail|
     amount = amount + order_detail.amount
   end
   return amount
 end
  # １つのorder内のorder_detailのamountを加算する
end
