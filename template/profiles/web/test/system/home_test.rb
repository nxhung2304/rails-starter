require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the root page" do
    visit root_path

    assert_text "Ship a new Rails app without rebuilding the baseline."
  end
end
