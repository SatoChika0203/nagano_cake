Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # 登録とパスワード変更のルーティングを削除する
  
  devise_for :customers,skip: [:passwords], controllers: {
    registration: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    resources :items
    resources :cart_items
  end
  # module: URLそのままで、ファイル構成（アクションとコントローラー）のみ指定のパスにしたい
  
  namespace :admin do
    root to: 'homes#top'
    resources :items
  end
  # URLを分けるにはnamespaceを使用する
  # 会員側と管理者側によって、ルーティング(URL 等)をグループ分けして管理する
end
