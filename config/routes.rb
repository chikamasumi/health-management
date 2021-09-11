Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
end
