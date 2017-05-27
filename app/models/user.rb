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

  validates :email, uniqueness: true

  before_validation { |u| u.email = u.email.downcase }
end
