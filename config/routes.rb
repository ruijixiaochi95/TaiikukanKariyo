Rails.application.routes.draw do
  namespace :public do
    get 'facilities/index'
  end
   # 管理者
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
    sessions: 'admin/sessions'
  }
  # ユーザー
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 施設管理者
  devise_for :gym_managers,skip: [:passwords], controllers: {
    registrations: "gym_manager/registrations",
    sessions: 'gym_manager/sessions'
  }

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about', as: 'about'
  get 'admin' => 'admin/homes#top', as: 'admin'
  get 'gym_manager' => 'gym_manager/homes#top', as: 'gym_manager'

  # 管理者
  namespace :admin do
    get 'homes/top'
    resources :gym_managers, only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :gyms, only: [:index, :show, :edit, :destroy, :update] 
    resources :facilities, only: [:show, :index, :destroy]
    resources :reservations
  end
  # 体育館管理者
  namespace :gym_manager do
    get 'homes/top'
    get 'my_page' => 'gym_managers#show'
    get 'infomation/edit' => 'gym_managers#edit'
    patch '/infomation' => 'gym_managers#update'
    resources :gyms, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :facilities, only: [:destroy, :create, :edit, :update] 
    end 
  end
  # ユーザー
  namespace :public do
    get 'homes/top'
  end
  scope module: :public do
    get 'users/my_page' => 'users#show'
    get 'users/infomation/edit' => 'users#edit'
    patch '/users/infomation' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal'
    resources :users, only: [:show, :edit, :update]
    resources :gyms, only: [:index, :show] do
      resources :facilities, only: [:show, :index] do
        resources :reservations
      end 
    end
    # resources :reservations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
