class TasksController < ApplicationController
    def new
      if check_user_auth.nil?
        redirect_to "/users/login"
        return
      end

      @task = Task.new
    end

    def create
      @task = Task.new(task_params)

      login_user = check_user_auth

      if login_user == nil
        redirect_to "/users/login"
      else
        if @task.save
          UserTask.create(user_id: login_user.id, task_id: @task.id)
          
          redirect_to "/users/#{login_user.id}/tasks/#{@task.id}"
        end
      end
    end

    def show
      @task = Task.find(params[:id])
    end

    private
    	def task_params
    		params.require(:task).permit(:title, :content)
    	end
  end
  