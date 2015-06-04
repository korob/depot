# -*- encoding : utf-8 -*-
require 'test_helper'

class ExelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
