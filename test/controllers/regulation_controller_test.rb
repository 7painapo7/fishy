require 'test_helper'

class RegulationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get regulation_new_url
    assert_response :success
  end

  test "should get create" do
    get regulation_create_url
    assert_response :success
  end

  test "should get destroy" do
    get regulation_destroy_url
    assert_response :success
  end

end
