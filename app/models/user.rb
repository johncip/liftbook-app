# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# A Liftbook user.
class User < ApplicationRecord
  before_validation { |u| u.email = u.email.downcase }
  validates :email, uniqueness: true
end
