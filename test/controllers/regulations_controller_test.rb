require 'test_helper'

class RegulationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get regulations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get regulations_destroy_url
    assert_response :success
  end

end
