require 'test_helper'

class GroupControllerTest < ActionController::TestCase
  test "should get get_group_info" do
    get :get_group_info
    assert_response :success
  end

end
