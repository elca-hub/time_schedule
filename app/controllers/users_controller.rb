class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
    	@user = User.new(user_params)
    	if @user.save
			set_session(@user.id, @user.password)
    		redirect_to @user
    	else
    		render :new, status: :unprocessable_entity
    	end
    end

	def login_check
		@user = User.new(user_params)

		login_user = User.find_by_name(@user.name)

		if login_user.nil?
			redirect_to "/users/login"
			return
		end

		can_not_login = check_user_auth(login_user, @user.password).nil?

		redirect_to can_not_login ? "/users/login" : "/users/#{login_user.id}"
	end

	def login
		user = check_user_auth
		if user
			redirect_to "/users/#{user.id}"
		end
		@user = User.new
	end

	def show
		@login_user = check_user_auth

		if @login_user == nil
			redirect_to "/users/login"
		end
	end

	def logout
		set_session(nil, nil)

		redirect_to root_path
	end
    
    private
    	def user_params
    		params.require(:user).permit(:name, :password)
    	end
end
