# == Schema Information
#
# Table name: lifts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nickname   :string           default("new"), not null
#

# A unique lift within this user's workout log.
class Lift < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :nicknames

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :nickname, presence: true, uniqueness: {case_sensitive: false}

  before_validation { self.name ||= nickname }

  def self.find_or_create_by_user_and_nickname(user, nickname)
    found = Lift.where('lower(nickname) = ?', nickname.downcase)
                .where(user: user) # rubocop:disable Rails/FindBy
                .first

    found || create(user: user, nickname: nickname)
  end
end
