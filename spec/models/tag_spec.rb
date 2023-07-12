require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { build(:tag) }
  subject { tag }

  describe "バリデーション関連" do
    context "すべての属性が完璧なアイドルな場合" do
      it "有効" do
        is_expected.to be_valid
      end
    end

    describe "名称" do
      context "名称が空文字の場合" do
        it "無効" do
          tag.name = ""

          is_expected.not_to be_valid
        end
      end

      context "名称が100文字以下の場合" do
        it "有効" do
          tag.name = "a" * 100

          is_expected.to be_valid
        end
      end

      context "名称が101文字以上の場合" do
        it "無効" do
          tag.name = "a" * 101

          is_expected.not_to be_valid
        end
      end

      context "名称が重複している場合" do
        before do
          create(:tag, name: tag.name)
        end

        it "無効" do
          is_expected.not_to be_valid
        end
      end
    end

    describe "説明" do
      context "説明が500文字以下の場合" do
        it "有効" do
          tag.description = "a" * 500

          is_expected.to be_valid
        end
      end

      context "説明が501文字以上の場合" do
        it "無効" do
          tag.description = "a" * 501

          is_expected.not_to be_valid
        end
      end

      context "説明が空文字の場合" do
        it "有効" do
          tag.description = ""

          is_expected.to be_valid
        end
      end
    end
  end
end
