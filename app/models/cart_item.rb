class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  # belongs_toはsつけない
  
  def subtotal
    item.with_tax_price * amount  #小計を求めるメソッド
  end
  # カート機能で使用するメソッドのためカートモデルに記述
  # 消費税を求めるメソッドを呼び出した上で算出する
end
