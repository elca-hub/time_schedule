class UsersController < ApplicationController
	include ErrorMessage
    def new
    	@user = User.new
		@error_hash = get_view_error
    end

    def create
    	@user = User.new(user_params)
		begin
    		if @user.save
				update_auth_token(@user) # 認証トークンの作成
    			redirect_to @user
    		else
    			redirect_to "/users/login"
    		end
		rescue
			set_view_error('danger', 'ユーザ作成失敗', 'ユーザの作成に失敗しました。')
			
			redirect_to "/users/login"
		end
    end

	def login_check
		@user = User.new(user_params)

		login_user = user_login(@user.name, @user.password)

		if login_user == nil
			set_view_error('warning', '認証失敗', 'ユーザ名もしくはパスワードが違います。')
			redirect_to "/users/login"
		else
			redirect_to @user
		end
	end

	def login
		user = authenticate_user
		if user
			redirect_to "/users/#{user.id}"
		end
		@user = User.new
		@error_hash = get_view_error
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
