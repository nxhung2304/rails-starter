class User < ApplicationRecord
  include Discard::Model

  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def to_s = name.presence || email

  def active_for_authentication?
    super && !discarded?
  end

  def inactive_message
    discarded? ? :inactive : super
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "updated_at"]
  end
end
