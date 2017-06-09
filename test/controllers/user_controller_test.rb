require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get get_user_info" do
    get :get_user_info
    assert_response :success
  end

end
