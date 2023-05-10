class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
    	@user = User.new(user_params)
    	if @user.save
			update_auth_token(@user) # 認証トークンの作成
    		redirect_to @user
    	else
    		render :new, status: :unprocessable_entity
    	end
    end

	def login_check
		@user = User.new(user_params)

		login_user = user_login(@user.name, @user.password)

		redirect_to login_user == nil ? "/users/login" : "/users/#{login_user.id}"
	end

	def login
		user = authenticate_user
		if user
			redirect_to "/users/#{user.id}"
		end
		@user = User.new
	end

	def show
		@login_user = authenticate_user

		if @login_user == nil
			redirect_to "/users/login"
		end
	end

	def logout
		user_logout

		redirect_to root_path
	end
    
    private
    	def user_params
    		params.require(:user).permit(:name, :password)
    	end
end
