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

  test "rolify adds and checks roles" do
    user = create(:user)
    user.add_role(:admin)
    assert user.has_role?(:admin)
    assert_not user.has_role?(:editor)
  end

  test "paper_trail creates version on update" do
    user = create(:user)
    assert_difference "PaperTrail::Version.count" do
      user.update!(name: "Updated")
    end
  end
end
