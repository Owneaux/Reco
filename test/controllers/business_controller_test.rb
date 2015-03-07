require 'test_helper'

class BusinessControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
