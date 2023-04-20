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
		if session.key?(:user_name) || session.key?(:user_password)
			begin
				user = User.find(params[:id])
				# ユーザが存在して認証が成功したら
				if user && user.authenticate(session[:user_password])
					@login_user = user
					session[:user_name] = user.name
				else
					redirect_to root_path
				end
			rescue
				@login_user = nil
			end
		else
			if session.key?(:user_password)
				session[:user_password] = nil
			end

            redirect_to root_path
        end
	end

	def logout
		if session.key?(:user_name) || params.key?(:id)
			session_user = User.find_by_name(session[:user_name])
			p session_user.id
			p params[:id]
			if session_user.id.to_s == params[:id]
				session[:user_password] = nil
				session[:user_name] = nil
				
				redirect_to root_path
			end
		end
	end
    
    private
    	def user_params
    		params.require(:user).permit(:name, :password)
    	end
end
