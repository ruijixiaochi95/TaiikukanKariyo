class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  # 予約一覧
  def index
    @reservations = Reservation.page(params[:page]).per(10) 
  end
  # 予約詳細
  def show
    @reservation = Reservation.find(params[:id])
  end
  # 予約削除
  def destroy
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
    if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to admin_user_path(@user)
    else
      render 'show'
    end
  end 
end
