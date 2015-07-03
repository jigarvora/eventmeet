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
  EVENT_TYPES = [ "Public", "Private" ]
  has_and_belongs_to_many :users

  validates :title, :date, :loc_city, presence: true
  validates :hashcode, uniqueness: {message: "Event already exists" }

end
