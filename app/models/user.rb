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
  include ArDocStore::Model

  has_many :workouts
  has_many :entries, through: :workouts

  has_many :lifts
  has_many :nicknames, through: :lifts

  validates :email, uniqueness: true
  validates :units, presence: true

  before_validation { email.try(:downcase!) }
  before_validation { self.units ||= 'lb' }

  self.json_column = :settings
  json_attribute :units, :enumeration, values: Entry::UNITS, strict: true
  attribute :units
end
