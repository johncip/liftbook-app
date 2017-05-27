# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  date       :datetime         not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workout < ApplicationRecord
  has_many :entries

  # TODO: Workouts need some kind of user-friendly unique identifier.
  #       but not the date, since you can workout more than once per day.
  validates :date, uniqueness: true
end
