require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  subject { user }

  describe "GET /users/" do
    context "ログインしていない場合" do
      it "サインイン画面へリダイレクト" do
        get users_path

        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "メール認証が完了していない場合" do
      it "リダイレクト" do
        sign_in user

        get users_path

        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "メール認証が完了している場合" do
      it "ユーザ画面へリダイレクト" do
        user.confirm # メール認証を完了させる

        sign_in user

        get users_path

        expect(response).to have_http_status(200)
      end
    end
  end
end
