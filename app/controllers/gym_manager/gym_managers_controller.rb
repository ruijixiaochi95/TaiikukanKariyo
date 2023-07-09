class GymManager::GymManagersController < ApplicationController
   # 体育館管理者マイページ
  def show
    @gym_manager = current_gym_manager
  end 
  # 体育館管理者編集
  def edit
    @gym_manager = current_gym_manager
  end 
  # 顧客の登録情報更新
  def update
    @gym_manager = current_gym_manager
    if @gym_manager.update(gym_manager_params)
      redirect_to gym_manager_my_page_path,notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end
  
  private
  def gym_manager_params
    params.require(:gym_manager).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :is_open)
  end 
end
