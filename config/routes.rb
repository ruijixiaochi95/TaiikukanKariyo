Rails.application.routes.draw do
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
  
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :admin do
    get 'gym_managers/index'
    get 'gym_managers/show'
    get 'gym_managers/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'gyms/index'
    get 'gyms/show'
    get 'gyms/edit'
  end
  namespace :gym_manager do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :gym_manager do
    get 'facilitys/index'
    get 'facilitys/edit'
  end
  namespace :gym_manager do
    get 'gyms/new'
    get 'gyms/index'
    get 'gyms/show'
    get 'gyms/edit'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'reservations/new'
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :public do
    get 'gyms/index'
    get 'gyms/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
