require "test_helper"

class OmniauthCallbacksTest < ActionDispatch::IntegrationTest
  setup do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: "google_oauth2",
      uid: "123456789",
      info: { email: "google@example.com", name: "Google User" }
    )
  end

  teardown do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

  test "successful Google sign-in creates user and redirects" do
    assert_difference "User.count" do
      get "/users/auth/google_oauth2/callback"
    end
    assert_response :redirect
  end

  test "repeated sign-in reuses existing user" do
    get "/users/auth/google_oauth2/callback"
    sign_out :user

    assert_no_difference "User.count" do
      get "/users/auth/google_oauth2/callback"
    end
    assert_response :redirect
  end

  test "auth failure redirects to root with alert" do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    get "/users/auth/google_oauth2/callback"
    assert_response :redirect
    follow_redirect!
    assert_not_nil flash[:alert]
  end
end
