class Public::ReservationsController < ApplicationController
  before_action :facility_status
  before_action :authenticate_user!
  before_action :set_gym_and_facility, only: [:new, :create, :index, :show]
  # 予約新規登録画面
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
  # 予約一覧
  def index
    @reservations = @facility.reservations.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
  # 予約詳細
  def show
    @reservation = Reservation.find(params[:id])
  end
  # 予約新規作成
  def create
    @reservation = @facility.reservations.new(reservation_params)
    @reservation.facility_id = @facility.id
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to gym_facility_reservation_path(@gym, @facility, @reservation), notice: "予約情報を登録しました。" 
    else
      render 'new'
    end
  end
  # 予約削除
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to user_path(current_user.id), alert: "予約を削除しました。" 
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
  
  def facility_status
    @gym = Gym.find(params[:gym_id])
    @facility = @gym.facilities.find(params[:facility_id])
    if @facility.is_open == true 
      redirect_to gym_facilities_path
    end 
  end 
end
