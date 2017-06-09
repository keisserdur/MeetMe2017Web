require 'test_helper'

class PruebaControllerTest < ActionController::TestCase
  test "should get me1" do
    get :me1
    assert_response :success
  end

  test "should get me2" do
    get :me2
    assert_response :success
  end

  test "should get me3" do
    get :me3
    assert_response :success
  end

end
