require "application_system_test_case"

class StarshipsTest < ApplicationSystemTestCase
  test "visiting starships index" do
    visit starships_url
    assert_selector ".card", count: Starship.count
  end
end
