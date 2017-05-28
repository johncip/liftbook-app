# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  settings   :jsonb            default("{}"), not null
#

# A Liftbook user.
class User < ApplicationRecord
  has_many :workouts
  has_many :entries, through: :workouts

  has_many :lifts
  has_many :nicknames, through: :lifts

  validates :email, uniqueness: true
  validate :settings_units_inclusion

  before_validation { self.email = email.downcase }
  before_validation { self.settings['units'] ||= 'lb' }

  private

  def settings_units_inclusion
    unless Entry::UNITS.include?(settings['units'])
      errors.add(:settings, "units must be in #{Entry::UNITS}")
    end
  end
end
