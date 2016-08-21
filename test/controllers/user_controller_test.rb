require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get bookings" do
    get :bookings
    assert_response :success
  end

end
