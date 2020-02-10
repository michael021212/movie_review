require 'test_helper'

class BadsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bads_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bads_destroy_url
    assert_response :success
  end

end
