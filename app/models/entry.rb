# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  lift_id    :integer
#  sets       :integer          not null
#  reps       :integer          not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :decimal(100, 6)  not null
#  units      :string           not null
#  workout_id :integer
#

# A workout log entry.
class Entry < ApplicationRecord
  has_one :lift
  belongs_to :workout
end
