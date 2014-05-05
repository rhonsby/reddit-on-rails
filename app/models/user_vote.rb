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

class UserVote < ActiveRecord::Base
  validates :user, :link, presence: true
  validates :upvote, inclusion: { in: [true, false] }

  belongs_to :user
  belongs_to :link
end
