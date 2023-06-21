class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
	end

	def send_mail
		UserMailer.with(user: current_user).test_mail.deliver_later

		redirect_to users_path, notice: "テスト用のメール配信が完了しました。"
	end
end
