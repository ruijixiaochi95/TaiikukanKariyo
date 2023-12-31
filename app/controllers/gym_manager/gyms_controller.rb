class GymManager::GymsController < ApplicationController
  before_action :ensure_correct_gym_manager, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_gym_manager!
  
  def new
    @gym = Gym.new
  end

  def index
    @gyms = current_gym_manager.gyms
  end

  def show
    @gym = Gym.find(params[:id])
    @facility = Facility.new
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.gym_manager_id = current_gym_manager.id
    if @gym.save
      redirect_to gym_manager_gym_path(@gym.id), notice: "体育館情報を登録しました。予約を受けるには、設備登録をしてください" 
    else
      render 'new'
    end 
  end
  
  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to gym_manager_gym_path(@gym.id), notice: "体育館情報を変更しました。"
    else
      render "edit"
    end 
  end 
  
  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to gym_manager_gyms_path, alert: "体育館を削除しました。"
  end 

  private
  
  def gym_params
    params.require(:gym).permit(:name, :postal_code, :address, :phone_number, :caption, :is_open, :image, :latitude, :longitude, :usage_fee)
  end
  
  def ensure_correct_gym_manager
    @gym = Gym.find(params[:id])
    unless @gym.gym_manager == current_gym_manager
      redirect_to gym_manager_gyms_path
    end 
  end 
end