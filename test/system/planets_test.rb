require "application_system_test_case"

class PlanetsTest < ApplicationSystemTestCase
  test "visiting planets index" do
    visit planets_url
    assert_selector ".card", count: Planet.count
  end
end
