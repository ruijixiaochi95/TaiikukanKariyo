class GymManager::ReservationsController < ApplicationController
  before_action :authenticate_gym_manager!
  def index
    @reservations = Reservation.joins(:facility).where(facilities: { gym_id: current_gym_manager.gyms.pluck(:id) })
    # @q_reservation = Reservation.joins(facility: :gym).where(facilities: { gym_id: current_gym_manager.gyms.pluck(:id) }).ransack(params[:q_reservation])
    # @reservations = @q_reservation.result(distinct: true)
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
