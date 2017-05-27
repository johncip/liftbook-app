# == Schema Information
#
# Table name: lifts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# A unique lift within this user's workout log.
class Lift < ApplicationRecord
  belongs_to :user
  has_many :entries

  validates :name, uniqueness: true
end
