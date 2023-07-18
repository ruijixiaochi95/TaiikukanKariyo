class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
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
