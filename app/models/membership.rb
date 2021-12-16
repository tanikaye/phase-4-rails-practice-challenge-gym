class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :unique_membership
  validates :gym_id, :client_id, :charge, presence: true

  def unique_membership
    Membership.all.each do |m|
      if client_id == m.client_id && gym_id == m.gym_id
        errors.add(:client_id, "not working stoopid")
      end
    end
  end
end


