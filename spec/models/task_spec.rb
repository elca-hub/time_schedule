require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }
  subject { task }

  describe "バリデーション関連" do
    context "全ての属性が完璧な場合" do
      it '有効' do
        is_expected.to be_valid
      end
    end

    describe "タイトル" do
      context "タイトルが空の場合" do
        it '無効' do
          task.title = ""
  
          is_expected.not_to be_valid
        end
      end

      context "タイトルが100文字以下の場合" do
        it '有効' do
          task.title = "a" * 100

          is_expected.to be_valid
        end
      end

      context "タイトルが101文字以上の場合" do
        it '無効' do
          task.title = "a" * 101

          is_expected.not_to be_valid
        end
      end

      context "タイトルが重複している場合" do
        before do
          create(:task, title: task.title)
        end
        it "有効" do
          is_expected.to be_valid
        end
      end
    end

    describe "内容" do
      context "内容が空の場合" do
        it '有効' do
          task.content = ""

          is_expected.to be_valid
        end
      end
    end

    context "内容が500文字以下の場合" do
      it '有効' do
        task.content = "a" * 500

        is_expected.to be_valid
      end
    end

    context "内容が501文字以上の場合" do
      it '無効' do
        task.content = "a" * 501

        is_expected.not_to be_valid
      end
    end
  end
end
