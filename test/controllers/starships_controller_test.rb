require "test_helper"

class StarshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get starships_url
    assert_response :success
  end

  test "should get show" do
    get starships_url(Starship.first)
    assert_response :success
  end
end
