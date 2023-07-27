class Admin::GymsController < ApplicationController
  before_action :authenticate_admin!
  # 体育館一覧
  def index
    @gyms = Gym..page(params[:page]).per(5) 
  end
  # 体育館詳細
  def show
    @gym = Gym.find(params[:id])
  end
  # 体育館編集
  def edit
    @gym = Gym.find(params[:id])
  end
  # 体育館更新
  def update
    @gym = Gym.find(params[:id])
    if @gym.update(gym_params)
      redirect_to admin_gym_path(@gym.id), notice: "体育館情報を変更しました。"
    else
      render "edit"
    end 
  end 
  # 体育館削除
  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to admin_gyms_path, alert: "体育館を削除しました。"
  end 
  
  private
  def gym_params
    params.require(:gym).permit(:name, :postal_code, :address, :phone_number, :caption, :is_open, :image, :latitude, :longitude, :usage_fee)
  end
end
