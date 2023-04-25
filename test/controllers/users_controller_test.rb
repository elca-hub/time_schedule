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

  # ユーザモデルのみからタスクを取得することが可能か検証
  test "should fetch task only use user model" do
    user = User.new(name: "test", password: "user")

    task = Task.new(title: "task test", content: "this is test task")

    user.save
    task.save
    user_task = UserTask.new(user_id: user.id, task_id: task.id)
    user_task.save

    test_user = User.find(user.id)
    assert test_user.tasks[0] == task
  end
end
