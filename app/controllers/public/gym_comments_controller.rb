class Public::GymCommentsController < ApplicationController

  def create
    @gym = Gym.find(params[:gym_id])
    if current_user.nil?
      redirect_to new_user_registration_path, notice: "コメントをするには、会員登録をしてください。"
    return
    end

    @gym_comment = GymComment.new(gym_comment_params)
    @gym_comment.gym_id = @gym.id
    @gym_comment.user_id = current_user.id

    if @gym_comment.save
      redirect_to gym_path(@gym), notice: "コメントしました。"
    else
      redirect_to gym_path(@gym), alert: "コメントに失敗しました。"
    end
  end


  def destroy
    @gym = Gym.find(params[:gym_id])
    gym_comment = @gym.gym_comments.find(params[:id])
    gym_comment.destroy
    redirect_to gym_path(@gym),  alert: "コメントを削除しました。"
  end

  private

  def gym_comment_params
    params.require(:gym_comment).permit(:comment, :rate)
  end
end
