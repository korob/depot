require 'test_helper'

class SushisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end