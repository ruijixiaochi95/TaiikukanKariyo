class Public::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day.to_s + " " + @time.to_s + " " + "JST")
    @facility = Facility.find(params[:facility_id])
    @gym = Gym.find(params[:gym_id])
  end

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    reservation = Reservation.find(params[:id])
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:day, :time, :user_id, :start_time, :gym_id)
  end
end
