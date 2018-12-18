require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get lists_start_url
    assert_response :success
  end

end
