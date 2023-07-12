require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { build(:user) }
  subject { user }

  subject(:mail) do
    described_class.with(user: user, root_url: "http://localhost:3000/").welcome_mail.deliver_now
    ActionMailer::Base.deliveries.last
  end

  describe "メール配信" do
    it "メール配信が正常に行われた場合" do
      expect(mail.to.first).to eq user.email
    end
  end
end
