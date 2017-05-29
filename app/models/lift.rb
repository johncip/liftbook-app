# == Schema Information
#
# Table name: lifts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nickname   :string           not null
#

# A unique lift within this user's workout log.
class Lift < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :nicknames

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :nickname, presence: true, uniqueness: {case_sensitive: false}

  before_validation { self.name ||= nickname }

  def self.find_by_nickname(nickname)
    User.where('lower(nickname) = ?', nickname.downcase).first # rubocop:disable Rails/FindBy
  end
end
