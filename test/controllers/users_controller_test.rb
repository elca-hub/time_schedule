require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # 同じ名前の人を追加することができないか検証
  test "should do not insert same name user" do
    user = User.new(name: "test", password: "user")

    begin
      User.create(name: user.name, password: user.password)

      User.create(name: user.name, password: user.password)
    rescue => exception
      assert exception.class == ActiveRecord::RecordNotUnique
    end
  end
end
