require "test_helper"

class AbilityTest < ActiveSupport::TestCase
  test "guest cannot do anything" do
    ability = Ability.new(nil)
    assert ability.cannot?(:read, :all)
  end

  test "default user can read" do
    ability = Ability.new(create(:user))
    assert ability.can?(:read, :all)
    assert ability.cannot?(:create, :all)
  end

  test "admin can manage all" do
    user = create(:user)
    user.add_role(:admin)
    ability = Ability.new(user)
    assert ability.can?(:manage, :all)
  end
end
