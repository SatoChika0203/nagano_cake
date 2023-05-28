class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  # 0 が入っている場合は credit_card(クレジットカード)
  # 1 が入ってる場合は transfer(銀行振込)
  
end
