require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # 同じ名前の人を追加することができないか検証
  test "should do not insert same name user" do
    user = User.new(name: "test", password: "user", email: "test1111@gmail.com")

    user.save
    assert user.save == false
  end

  # ユーザモデルのみからタスクを取得することが可能か検証
  test "should fetch task only use user model" do
    user = User.new(name: "test", password: "userpassword", email: "test1111@gmail.com")

    task = Task.new(title: "task test", content: "this is test task")

    user.save
    task.save
    user_task = UserTask.new(user: user, task: task)
    user_task.save

    test_user = User.find(user.id)
    assert test_user.tasks[0] == task
  end

  test "should do not inseart password's charactar length less than 8 and more than 32." do
    assert User.new(name: "test user", password: "test", email: "test1111@gmail.com").save == false
  end
end
