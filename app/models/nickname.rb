# An alternate name for a lift. e.g. "bp" or "bench" for "bench press".
class Nickname < ApplicationRecord
  belongs_to :lift
end
