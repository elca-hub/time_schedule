class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
		  @user = current_user
    end

    def new
      @task = Task.new
      @tags = Tag.where(user_id: current_user.id)

      if @tags.nil?
        redirect_to new_tag_path, alert: ["タグを作成してからタスクを作成してください。"]
      end
    end

    def create
    	@task = Task.new(task_params)
		  user = current_user

      @task.user_id  = user.id

      if @task.save
		    redirect_to tasks_path, notice: "タスクの作成が完了しました。"
      else
        redirect_to new_task_path, alert: @task.errors.full_messages
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

    redirect_to @task, notice: "タスクの編集が完了しました。"
    end

    def show
      @task = Task.find(params[:id])
    end

    def destroy
      @task = Task.find(params[:id])


      @task.destroy

      redirect_to tasks_path, notice: "タスクの削除が完了しました。"
    end

    private
    	def task_params
    		params.require(:task).permit(:title, :content, :tag_id)
    	end
end
  