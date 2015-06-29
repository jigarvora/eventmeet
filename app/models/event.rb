# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  loc_city    :string
#  event_code  :string
#  visibility  :integer
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
end
