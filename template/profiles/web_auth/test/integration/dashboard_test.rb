require "test_helper"

class DashboardTest < ActionDispatch::IntegrationTest
  test "redirects guests to sign in" do
    get "/"

    assert_response :redirect
  end

  test "renders dashboard for signed in users" do
    user = User.create!(email: "test@example.com", password: "password")
    sign_in user

    get "/"

    assert_response :success
    assert_select "h1", "Welcome, test@example.com!"
    assert_select "button", "Sign out"
  end
end
