# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  lift_id    :integer          not null
#  sets       :integer          not null
#  reps       :integer          not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :decimal(100, 6)  not null
#  units      :string           not null
#  workout_id :integer          not null
#

# A workout log entry.
class Entry < ApplicationRecord
  belongs_to :lift
  belongs_to :workout

  before_save -> { self.units ||= :lb }
  UNITS = %w(lb kg).freeze
  validates :units, inclusion: { in: UNITS }
end
