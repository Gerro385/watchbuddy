class Request < ApplicationRecord
  validates :users_are_not_yet_friends

  def users_are_not_yet_friends
    if Request.where(sender_id: :sender_id, receiver_id: :receiver_id).exist? || Request.where(sender_id: :receiver_id, receiver_id: :sender_id).exist?
      self.errors.add(:sender_id, 'Request already exists!')
    end
  end
end
