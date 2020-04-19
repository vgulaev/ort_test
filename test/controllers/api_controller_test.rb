require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get server" do
    get api_server_url
    assert_response :success
  end

  test "should get bandwidth" do
    get api_bandwidth_url
    assert_response :success
  end
end
