class Public::UsersController < ApplicationController
  # ユーザーマイページ
  def show
    @user = current_user
    @user_reservations = current_user.reservations.where("start_time >= ?", DateTime.current).order(day: :desc)
    @visit_historys = current_user.reservations.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)
    @reservations = @user.reservations.includes(:facility)
  end 
  # ユーザー編集
  def edit
    @user = current_user
  end 
  # ユーザーの登録情報更新
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path,notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :is_open)
  end 
end
