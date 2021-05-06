require "application_system_test_case"

class SpeciesTest < ApplicationSystemTestCase
  test "visiting species index" do
    visit species_index_url
    assert_selector ".card", count: Species.count
  end
end
