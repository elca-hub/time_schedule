class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
		@user = current_user
    	@tasks = @user.tasks
    end

    def new
      @task = Task.new
    end

    def create
    	@task = Task.new(task_params)

		user = current_user
    	if @task.save
    		UserTask.create(user_id: user.id, task_id: @task.id)
		
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
    		params.require(:task).permit(:title, :content)
    	end
end
  