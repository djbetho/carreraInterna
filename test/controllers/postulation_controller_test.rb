require "test_helper"

class PostulationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postulation_index_url
    assert_response :success
  end
end
