require "test_helper"

class PlanetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planets_url
    assert_response :success
  end

  test "should get show" do
    get planets_url(Planet.first)
    assert_response :success
  end
end
