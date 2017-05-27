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

# TODO: Workouts need some kind of user-friendly unique identifier.
class Workout < ApplicationRecord
  belongs_to :user
  has_many :entries
end
