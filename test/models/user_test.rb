require "test_helper"

class UserTest < ActiveSupport::TestCase
  # 同じ名前の人を追加することができないか検証
  test "should do not insert same name user" do
    user = User.new(name: users(:one).name, password: "user", email: "test02@test.com")

    assert user.save == false
  end

  # 同じメールアドレスの人を追加することができないか検証
  test "should do not insert same email user" do
    user = User.new(name: "cannotinsert", password: "user", email: users(:one).email)

    assert user.save == false
  end

  # ユーザモデルのみからタスクを取得することが可能か検証
  test "should fetch task only use user model" do

    task = Task.new(title: "task test", content: "this is test task")
    user = users(:one)

    task.save
    user_task = UserTask.new(user: user, task: task)
    user_task.save

    test_user = User.find(user.id)
    assert test_user.tasks[0] == task
  end

  test "should do not inseart password's charactar length less than 6 and more than 32." do
    assert User.new(name: "test user", password: "test", email: "test1111@gmail.com").save == false
  end
end
