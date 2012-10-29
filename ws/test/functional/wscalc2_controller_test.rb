require 'test_helper'

class Wscalc2ControllerTest < ActionController::TestCase
  test "should get restar" do
    get :restar
    assert_response :success
  end

  test "should get dividir" do
    get :dividir
    assert_response :success
  end

end
