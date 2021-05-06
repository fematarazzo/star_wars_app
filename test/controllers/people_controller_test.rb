require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get show" do
    get people_url(Person.first)
    assert_response :success
  end
end
