require 'test_helper'

class HelpsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get helps_show_url
    assert_response :success
  end

end
