Rails.application.routes.draw do

  #devise_for :users
  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about" , as: "about"
    resources :conditions, only: [:new, :index, :edit, :update, :create]
    resources :inquiries, only: [:new, :index, :show, :create] do
      collection do
        post :confirm
        get :compleate
      end
    end
    devise_for :users, :controllers => {
      :registrations => 'public/registrations',
      :sessions => 'public/sessions',
      :passwords => 'public/passwords'
    }
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update]
  end

  get 'admin/users/search' => 'admin/users#search' , as: 'admin_user_search'
  get 'admin/inquiries/search' => 'admin/inquiries#search' , as: 'admin_inquiry_search'
  namespace :admin do
    root to: 'homes#top'
    resources :conditions, only: [:show]
    resources :inquiries, only: [:index, :show]
    resources :users, only: [:index, :show]
  end

  devise_for :admin, controllers: {
    #sessions:      'admin/sessions',
    #passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
end
