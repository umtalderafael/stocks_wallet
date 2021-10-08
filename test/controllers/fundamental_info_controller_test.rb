require 'test_helper'

class FundamentalInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fundamental_info_new_url
    assert_response :success
  end

  test "should get create" do
    get fundamental_info_create_url
    assert_response :success
  end

  test "should get destroy" do
    get fundamental_info_destroy_url
    assert_response :success
  end

end
