require 'test_helper'

class ServerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get server_index_url
    assert_response :success
  end

end
