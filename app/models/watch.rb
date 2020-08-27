class Watch < ApplicationRecord
  belongs_to :user
  after_initialize :set_favourite

  private

  def set_favourite
    self.favourite = false
  end
end
