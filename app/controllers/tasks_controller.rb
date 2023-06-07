class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
		@user = current_user
    	@tasks = @user.task
    end

    def new
      @tag = Task.new
    end

    def create
    	@tag = Task.new(task_params)
		  user = current_user

      @tag.user_id  = user.id

      if @tag.save
		    		redirect_to tasks_path
      end
    end

    def edit
      @tag = Task.find(params[:id])

      if @tag.nil?
        redirect_to "/users/#{params[:user_id]}"

        return
      end
    end

    def update
		@tag = Task.find(params[:id])

		@tag.update(task_params)

    redirect_to @tag
    end

    def show
      @tag = Task.find(params[:id])
    end

    def destroy
      @tag = Task.find(params[:id])


      @tag.destroy

      redirect_to tasks_path
    end

    private
    	def task_params
    		params.require(:task).permit(:title, :content)
    	end
end
  