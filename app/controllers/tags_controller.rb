class TagsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tag = Tag.new(color_code: "##{SecureRandom.hex(3)}")
  end

  def create
  	@tag = Tag.new(tag_params.merge(user_id: current_user.id))

    if @tag.save
		  		redirect_to tasks_path
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

		@tag.update(tag_params)

    redirect_to tasks_path
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tasks_path
  end
  

  private
  	def tag_params
  		params.require(:tag).permit(:name, :color_code, :description)
  	end
end
