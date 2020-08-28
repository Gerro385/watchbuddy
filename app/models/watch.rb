class Watch < ApplicationRecord
  belongs_to :user
  # after_initialize :set_favourite, :set_seen

  # private

  # def set_favourite
  #   self.favourite = false
  # end

  # def set_seen
  #   self.seen = false
  # end
end
