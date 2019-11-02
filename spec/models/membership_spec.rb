# frozen_string_literal: true

require "rails_helper"

RSpec.describe Membership, :type => :model do
  it { should belong_to(:group) }
  it { should belong_to(:member).dependent(true) }

  describe "#destroy" do
    subject {
      FactoryBot.create(:membership)
    }

    it "destroys the associated Member" do
      subject.destroy
      expect {
        subject.member.reload
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end