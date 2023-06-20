class TagsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tag = Tag.new(color_code: "##{SecureRandom.hex(3)}")
  end

  def create
  	@tag = Tag.new(tag_params.merge(user_id: current_user.id))

    if @tag.save
		  redirect_to tasks_path, notice: "タグの作成が完了しました。"
    else
      redirect_to new_tag_path, alert: @tag.errors.full_messages
    end
  end

  def edit
    @tag = Tag.find_by(id: params[:id], user: current_user)
  end

  def update
    @tag = Tag.find_by(id: params[:id], user: current_user)

		if @tag.update(tag_params)
      redirect_to tasks_path, notice: "タグの編集が完了しました。"
    else
      redirect_to edit_tag_path(@tag), alert: @tag.errors.full_messages
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tasks_path, notice: "タグの削除が完了しました。"
  end
  

  private
  	def tag_params
  		params.require(:tag).permit(:name, :color_code, :description)
  	end
end
