# == Schema Information
#
# Table name: nicknames
#
#  id         :integer          not null, primary key
#  lift_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# An alternate name for a lift. e.g. "bp" for "bench press".
class Nickname < ApplicationRecord
  belongs_to :lift
  validates :name, uniqueness: true
end
