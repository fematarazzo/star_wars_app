require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url # "/"
    assert_selector "h1", text: "Bem-vindos ao universo de Star Wars!"
  end
end
