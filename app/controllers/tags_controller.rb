class TagsController < ApplicationController
    before_action :authenticate_user!

    def new
      @tag = Tag.new
    end

    def create
    	@tag = Tag.new(tag_params)
		  user = current_user

      @tag.user_id  = user.id

      if @tag.save
		    		redirect_to tasks_path
      end
    end

    private
    	def tag_params
    		params.require(:tag).permit(:name)
    	end
end
