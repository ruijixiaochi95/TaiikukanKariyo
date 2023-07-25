class Public::GymCommentsController < ApplicationController

  def create
    @gym = Gym.find(params[:gym_id])
    @gym_comment = GymComment.new(gym_comment_params)
    @gym_comment.gym_id = @gym.id
    @gym_comment.user_id = current_user.id
    @gym_comment.save
    # redirect_to gyms_path(@gym)
    respond_to do |format|
      format.js { render 'create' } 
    end
  end

  def destroy
    @gym = Gym.find(params[:gym_id])
    gym_comment = @gym.gym_comments.find(params[:id])
    gym_comment.destroy
    # redirect_to gyms_path(@gym)
  end

  private

  def gym_comment_params
    params.require(:gym_comment).permit(:comment)
  end
end
