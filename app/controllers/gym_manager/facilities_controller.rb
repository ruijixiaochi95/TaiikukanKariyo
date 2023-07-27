class GymManager::FacilitiesController < ApplicationController
  before_action :authenticate_gym_manager!
  def create
    @gym = Gym.find(params[:gym_id])
    @facility = Facility.new(facility_params)
    @facility.gym_id = @gym.id
    if @facility.save
      redirect_to gym_manager_gym_path(@gym.id), notice: "設備を登録しました"
    else
      redirect_to gym_manager_gym_path(@gym.id), alert: "設備の登録に失敗しました"
    end 
  end
  
  def destroy
    Facility.find(params[:id]).destroy
    @gym = Gym.find(params[:gym_id])
    redirect_to gym_manager_gym_path(@gym.id), alert: "設備を削除しました"
  end
  
  def update
    facility = Facility.find(params[:id])
    if facility.update(facility_params)
      @gym = Gym.find(params[:gym_id])
      redirect_to gym_manager_gym_path(@gym.id), notice: "施設の予約状況が変更されました。"
    else
      redirect_to gym_manager_gym_path(params[:gym_id]), alert: "施設の予約状況の変更に失敗しました。"
    end
  end 

  private

  def facility_params
    params.require(:facility).permit(:name, :gym_id, :is_open)
  end
end
