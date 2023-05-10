class TasksController < ApplicationController
    def index
      @user = authenticate_user

      if @user.nil?
        redirect_to  "/users/login"
        return
      end

      @tasks = @user.tasks
    end
    def new
      if authenticate_user.nil?
        redirect_to "/users/login"
        return
      end

      @task = Task.new
    end

    def create
      @task = Task.new(task_params)

      login_user = authenticate_user

      if login_user == nil
        redirect_to "/users/login"
      else
        if @task.save
          UserTask.create(user_id: login_user.id, task_id: @task.id)
          
          redirect_to "/users/#{login_user.id}/tasks/#{@task.id}"
        end
      end
    end

    def edit
      @user = authenticate_user

      if @user.nil?
        redirect_to "/users/login"

        return
      end

      @task = Task.find(params[:id])

      if @task.nil?
        redirect_to "/users/#{params[:user_id]}"

        return
      end
    end

    def update
      Task.update(params[:id], task_params)

      redirect_to @task
    end

    def show
      @user = authenticate_user
      if @user.nil?
        redirect_to "/users/login"
        return
      end
      @task = Task.find(params[:id])
    end

    private
    	def task_params
    		params.require(:task).permit(:title, :content)
    	end
  end
  