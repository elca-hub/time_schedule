class UsersController < ApplicationController
	include ErrorMessage
	
	before_action :authenticate_user!

	def show
		@user = current_user
	end
end
