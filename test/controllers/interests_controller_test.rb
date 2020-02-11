require 'test_helper'

class InterestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get interests_destroy_url
    assert_response :success
  end

end
