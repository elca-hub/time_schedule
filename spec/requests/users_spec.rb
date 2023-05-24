require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/" do
    it "サインイン画面へのリダイレクト(ログインせずに)" do
      get "/users/"

      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
