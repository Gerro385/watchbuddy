class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validate :file_too_big
  has_one_attached :photo
  has_many :watches

  def file_too_big
    errors.add(:user_id, 'File size too large!') if File.size(photo) / 2**20.round(2) > 10
  end

  include PgSearch::Model
  pg_search_scope :search_by_email_and_first_name_and_last_name,
    against: [ :email, :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
