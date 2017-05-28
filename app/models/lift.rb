# == Schema Information
#
# Table name: lifts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# A unique lift within this user's workout log.
class Lift < ApplicationRecord
  attribute :name

  belongs_to :user
  has_many :entries
  has_many :names, class_name: 'LiftName'

  validates :name, presence: true

  before_save :ensure_name

  def name
    @name ||= names.find_by(main: true).name
  end

  def name=(val)
    @name = val
  end

  def nicknames
    names.where(main: false)
  end

  private

  def ensure_name
    names.update_all(main: false)
    names.find_or_create_by(name: name).update!(main: true)
  end
end
