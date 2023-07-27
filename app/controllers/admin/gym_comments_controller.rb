class Admin::GymCommentsController < ApplicationController
  
  def destroy
    @gym = Gym.find(params[:gym_id])
    gym_comment = @gym.gym_comments.find(params[:id])
    gym_comment.destroy
    redirect_to admin_gym_path(@gym),  alert: "コメントを削除しました。"
  end
  
end
