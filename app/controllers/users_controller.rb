class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
    	@user = User.new(user_params)
    	if @user.save
            session[:user_name] = @user.name
            session[:user_password] = @user.password
    		redirect_to @user
    	else
    		render :new, status: :unprocessable_entity
    	end
    end

	def show
		puts session[:user_name]
		puts session[:user_password]
		
		if session.key?(:user_name) || session.key?(:user_password)
			user = User.find(params[:id])
			# ユーザが存在して認証が成功したら
			if user && user.authenticate(session[:user_password])
				@login_user = user
                session[:user_name] = user.name
			else
				redirect_to root_path
			end
		else
            redirect_to root_path
        end
	end
    
    private
    	def user_params
    		params.require(:user).permit(:name, :password)
    	end
end
