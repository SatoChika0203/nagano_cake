Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # 登録とパスワード変更のルーティングを削除する
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :customers
    resources :items
    resources :cart_items
    resources :orders
    resources :order_details
  end
  # module: URLそのままで、ファイル構成（アクションとコントローラー）のみ指定のパスにしたい
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :items
    resources :orders
    resources :order_details
  end
  # URLを分けるにはnamespaceを使用する
  # 会員側と管理者側によって、ルーティング(URL 等)をグループ分けして管理する
end
