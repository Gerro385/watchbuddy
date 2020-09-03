class Medium < ApplicationRecord
  has_many :watches

  validates :tmdb_id, uniqueness: true
  validates :runtime, presence: true
end
