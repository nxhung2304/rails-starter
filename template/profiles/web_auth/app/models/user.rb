class User < ApplicationRecord
  include Discard::Model

  rolify

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && !discarded?
  end

  def inactive_message
    discarded? ? :inactive : super
  end
end
