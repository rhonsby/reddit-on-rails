# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  subject { build(:user) }

  it { should be_valid }
  it { should validate_presence_of(:username) }

  describe "associations" do
    it { should have_many(:moderated_subs) }
    it { should have_many(:submitted_links) }
    it { should have_many(:authored_comments) }
    it { should have_many(:user_votes) }
  end
end
