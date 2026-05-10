require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid with email" do
    assert build(:user).valid?
  end

  test "invalid without email" do
    assert_not build(:user, email: nil).valid?
  end

  test "email must be unique" do
    create(:user, email: "dup@example.com")
    assert_not build(:user, email: "dup@example.com").valid?
  end
end
