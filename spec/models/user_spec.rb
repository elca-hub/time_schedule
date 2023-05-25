require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  subject { user } 

  describe "バリデーション関連" do
    context "全ての属性が完璧な場合" do
      it '有効' do
        is_expected.to be_valid
      end
    end

    describe "name" do
      context "名前が空の場合" do
        it '無効' do
          user.name = ""
  
          is_expected.not_to be_valid
        end
      end
  
      context "名前が100文字以下の場合" do
        it '有効' do
          user.name = "a" * 100
  
          is_expected.to be_valid
        end
      end
  
      context "名前が101文字以上の場合" do
        it '無効' do
          user.name = "a" * 101
  
          is_expected.not_to be_valid
        end
      end
    end
    
    describe "password" do
      context "パスワードが空の場合" do
        it '無効' do
          user.password = ""
  
          is_expected.not_to be_valid
        end
      end

      context "パスワードが6文字未満の場合" do
        it '無効' do
          user.password = "a" * 5

          is_expected.not_to be_valid
        end
      end

      context "パスワードが6文字以上の場合" do
        it '有効' do
          user.password = "a" * 6

          is_expected.to be_valid
        end
      end
    end

    describe "email" do
      context "メールアドレスが空の場合" do
        it '無効' do
          user.email = ""

          is_expected.not_to be_valid
        end
      end

      context "メールアドレスが正しくない場合" do
        it '無効' do
          user.email = "test"

          is_expected.not_to be_valid
        end
      end

      context "メールアドレスが正しい入力の場合" do
        it '有効' do
          user.email = "test@example.com"

          is_expected.to be_valid
        end
      end
    end
  end
end
