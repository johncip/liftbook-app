# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  date       :datetime         not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  name       :string           default("New Workout"), not null
#

class Workout < ApplicationRecord
  belongs_to :user
  has_many :entries
end
