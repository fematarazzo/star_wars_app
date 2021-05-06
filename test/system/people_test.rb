require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  test "visiting the homepage" do
    visit root_url
    assert_selector ".card", count: Person.count
  end
end
