class UsersController < ApplicationController
	include ErrorMessage
	
	before_action :authenticate_user!

	def index
		@user = current_user
	end
end
