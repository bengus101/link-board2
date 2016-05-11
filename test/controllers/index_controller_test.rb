require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get restricted" do
    get :restricted
    assert_response :success
  end

end
