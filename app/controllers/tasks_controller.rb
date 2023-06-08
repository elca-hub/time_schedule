class TasksController < ApplicationController
    include ErrorMessage
    before_action :authenticate_user!

    def index
		  @user = current_user
    end

    def new
      @task = Task.new
      @tags = Tag.all

      if @tags.length == 0
        set_view_error("warning", "タグが登録されていません。", "タグを登録してからタスクを作成してください。")
        redirect_to new_tag_path
      end
    end

    def create
    	@task = Task.new(task_params)
		  user = current_user

      @task.user_id  = user.id

      if @task.save
		    redirect_to tasks_path
      end
    end

    def edit
      @task = Task.find(params[:id])

      if @task.nil?
        redirect_to "/users/#{params[:user_id]}"

        return
      end
    end

    def update
		@task = Task.find(params[:id])

		@task.update(task_params)

    redirect_to @task
    end

    def show
      @task = Task.find(params[:id])
    end

    def destroy
      @task = Task.find(params[:id])


      @task.destroy

      redirect_to tasks_path
    end

    private
    	def task_params
    		params.require(:task).permit(:title, :content, :tag_id)
    	end
end
  