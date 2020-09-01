class Request < ApplicationRecord
  enum status: %i[pending accepted declined]

  validates :sender_id, uniqueness: { scope: :receiver_id }
  validate :request_does_not_exist
  validate :same_user

  def request_does_not_exist
    errors.add(:sender_id, 'Request already exists!') if Request.find_by(sender_id: receiver_id, receiver_id: sender_id)
  end

  def same_user
    errors.add(:sender_id, 'Same user') if sender_id == receiver_id
  end
end
