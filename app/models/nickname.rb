# == Schema Information
#
# Table name: nicknames
#
#  id         :integer          not null, primary key
#  lift_id    :integer
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# An alternate name for a lift. e.g. "bp" or "bench" for "bench press".
class Nickname < ApplicationRecord
  belongs_to :lift
end
