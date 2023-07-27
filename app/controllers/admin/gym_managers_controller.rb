class Admin::GymManagersController < ApplicationController
  before_action :authenticate_admin!
   # 体育館管理者一覧
  def index
    @gym_managers = GymManager.all
  end
  # 体育館管理者詳細
  def show
    @gym_manager = GymManager.find(params[:id])
  end
  # 体育館管理者編集
  def edit
    @gym_manager = GymManager.find(params[:id])
  end
  # 体育館管理者の登録情報更新
  def update
    @gym_manager = GymManager.find(params[:id])
    if @gym_manager.update(gym_manager_params)
      redirect_to admin_gym_manager_path,notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end
  #体育館管理者の削除
  def destroy
    @gym_manager = GymManager.find(params[:id])
    @gym_manager.destroy
    redirect_to admin_gym_managers_path, notice: "体育館管理者を削除しました。"
  end
  
  private
  def gym_manager_params
    params.require(:gym_manager).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :is_open)
  end 
end
