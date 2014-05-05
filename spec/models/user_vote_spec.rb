# == Schema Information
#
# Table name: user_votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  link_id    :integer          not null
#  upvote     :boolean          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe UserVote do
  subject { build(:user_vote) }
end
