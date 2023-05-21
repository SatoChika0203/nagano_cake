Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # 登録とパスワード変更のルーティングを削除する
  
  # module: URLそのままで、ファイル構成（アクションとコントローラー）のみ指定のパスにしたい
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :order_details
    get '/customers/information/edit' => 'customers#edit', as: 'customers_information_edit'
    resource :customers, except: [:edit] do
      collection do
        get 'confirm'
        patch 'withdraw'
      end
      # resource :information, only: [:edit]
    end
    # get 'customers/information/edit' => 'public/customers#edit', as: 'customers_information_edit'
   end
   
    resources :cart_items, except: [:show, :new] do
      collection do
        delete 'destroy_all'
      end
    end
    
    resources :orders do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
  
  
  namespace :admin do
    root to: 'homes#top'
    post '/items/new_items_information' => 'items#create', as: 'items_new_items_information'
    resources :customers
    resources :orders
    resources :order_details
    resources :items, except: [:create] do
      collection do
        patch 'sales'
      end
    end
  end
  # URLを分けるにはnamespaceを使用する
  # adminがURLに入る
  # 会員側と管理者側によって、ルーティング(URL 等)をグループ分けして管理する
end
