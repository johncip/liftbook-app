# == Schema Information
#
# Table name: lift_names
#
#  id         :integer          not null, primary key
#  lift_id    :integer          not null
#  name       :string           not null
#  main       :boolean          default("true"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LiftName < ApplicationRecord
  belongs_to :lift
end
