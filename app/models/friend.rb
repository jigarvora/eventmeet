# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  friend_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ActiveRecord::Base
  belongs_to :user
  scope :all_except, ->(user) { where(["id NOT IN (?)", ([Friend.map(&:friend_id) << user.user_id]) ]) }

end
