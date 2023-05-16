class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  
  enum payment_method:{
    credit: 1,
    bank: 2,
  }
end
