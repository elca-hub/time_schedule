class TagsController < ApplicationController
  include ErrorMessage
  before_action :authenticate_user!

  def new
    @tag = Tag.new

    @error_hash = get_view_error

    # カラーコードをランダムに生成
    @color_code = "#" + SecureRandom.hex(3)
  end

  def create
  	@tag = Tag.new(tag_params)
	  user = current_user

    @tag.user_id = user.id

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
  

  private
  	def tag_params
  		params.require(:tag).permit(:name, :color_code, :description)
  	end
end
