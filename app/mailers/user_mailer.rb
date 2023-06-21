class UserMailer < ApplicationMailer
    default from: "no-reply@elca-web.com"

    def test_mail
        @user = params[:user]
        @url  = 'https://playground.elca-web.com/'
        mail(to: @user.email, subject: 'これはテスト用のメール内容となります。')
    end

    def welcome_mail
        @user = params[:user]
        @root_url = params[:root_url]

        mail(to: @user.email, subject: "【ご登録完了のお知らせ】ようこそ、timeScheduleへ!")
    end
end
