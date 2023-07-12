class Public::ReservationsController < ApplicationController
  before_action :set_gym_and_facility, only: [:new, :create, :index]

  def new
    @reservation = @facility.reservations.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day.to_s + " " + @time.to_s + " " + "JST")
  end

  def index
    @reservations = @facility.reservations.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @facility.reservations.new(reservation_params)
    if @reservation.save
      redirect_to gym_facility_reservations_path(@gym, @facility)
      # redirect_to gym_facility_reservation_path
    else
      render 'new'
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
