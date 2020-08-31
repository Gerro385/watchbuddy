class Request < ApplicationRecord
  enum status: %i[pending accepted declined]

  validate :users_are_not_yet_friends

  def users_are_not_yet_friends
    if Request.where(sender_id: :sender_id, receiver_id: :receiver_id).exists? || Request.where(sender_id: :receiver_id, receiver_id: :sender_id).exists?
      self.errors.add(:sender_id, 'Request already exists!')
    end
  end
end
