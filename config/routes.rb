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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
