class Public::ReservationsController < ApplicationController
  before_action :set_gym_and_facility, only: [:new, :create, :index, :show]

  def new
    @reservation = @facility.reservations.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day.to_s + " " + @time.to_s + " " + "JST")
    message = Reservation.check_reservation_day(@day.to_date)
    if !!message
      redirect_to gym_facility_reservations_path(@gym, @facility), flash: { alert: message }
    end
  end

  def index
    @reservations = @facility.reservations.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    # @reservation = @facility.reservations.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @facility.reservations.new(reservation_params)
    if @reservation.save
      redirect_to gym_facility_reservation_path(@gym, @facility, @reservation)
    else
      render 'new'
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to user_path(current_user.id)
    else
      render 'show'
    end
  end 

  private

  def set_gym_and_facility
    @gym = Gym.find(params[:gym_id])
    @facility = @gym.facilities.find(params[:facility_id])
  end

  def reservation_params
    params.require(:reservation).permit(:day, :time, :user_id, :start_time, :facility_id)
  end
end
