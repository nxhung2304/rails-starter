class User < ApplicationRecord
  rolify

  validates :email, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "updated_at"]
  end
end
