require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid with email and password" do
    assert build(:user).valid?
  end

  test "rolify adds and checks roles" do
    user = create(:user)
    user.add_role(:editor)
    assert user.has_role?(:editor)
    assert_not user.has_role?(:admin)
  end

  test "paper_trail creates version on update" do
    user = create(:user)
    assert_difference "PaperTrail::Version.count" do
      user.update!(name: "Updated")
    end
  end

  test "from_omniauth creates a new user" do
    auth = OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "111222",
      info: { email: "new@example.com", name: "New User" }
    )
    assert_difference "User.count" do
      User.from_omniauth(auth)
    end
  end

  test "from_omniauth finds an existing user" do
    auth = OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "111222",
      info: { email: "existing@example.com", name: "Existing User" }
    )
    User.from_omniauth(auth)
    assert_no_difference "User.count" do
      User.from_omniauth(auth)
    end
  end
end
