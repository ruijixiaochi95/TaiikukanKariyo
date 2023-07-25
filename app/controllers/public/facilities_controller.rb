class Public::FacilitiesController < ApplicationController
  before_action :gym_status
  before_action :authenticate_user!
  before_action :set_gym_and_facility
  # 施設一覧
  def index
    @facilities = @gym.facilities
  end
  
  private

  def set_gym_and_facility
    @gym = Gym.find(params[:gym_id])
  end
  # 体育館のステータスが予約不可なら一覧ページに飛ぶようにする
  def gym_status
    @gym = Gym.find(params[:gym_id])
    if @gym.is_open == true 
      redirect_to gyms_path
    end 
  end 
end
