class Admin::UsersController < ApplicationController
  # 会員一覧
  def index
    @users = User.all
  end
  # 会員詳細
  def show
    @user = User.find(params[:id])
  end
  # 会員編集
  def edit
    @user = User.find(params[:id])
  end
  # 会員の登録情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path,notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :is_active)
  end 
end
