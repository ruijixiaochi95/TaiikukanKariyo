class GymManager::ReservationsController < ApplicationController
  before_action :authenticate_gym_manager!
  def index
    @reservations = Reservation.joins(:facility).where(facilities: { gym_id: current_gym_manager.gyms.pluck(:id) })
    @reservations = @reservations.latest if params[:latest]
    @reservations = @reservations.old if params[:old]
    @reservations = @reservations.earliest_reservations if params[:earliest_reservations]
    @reservations = @reservations.latest_reservations if params[:latest_reservations]
    @reservations = @reservations.page(params[:page]).per(10) 
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
