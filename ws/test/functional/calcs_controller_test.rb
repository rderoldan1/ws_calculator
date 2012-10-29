require 'test_helper'

class CalcsControllerTest < ActionController::TestCase
  setup do
    @calc = calcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calc" do
    assert_difference('Calc.count') do
      post :create, calc: { resta: @calc.resta, suma: @calc.suma }
    end

    assert_redirected_to calc_path(assigns(:calc))
  end

  test "should show calc" do
    get :show, id: @calc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calc
    assert_response :success
  end

  test "should update calc" do
    put :update, id: @calc, calc: { resta: @calc.resta, suma: @calc.suma }
    assert_redirected_to calc_path(assigns(:calc))
  end

  test "should destroy calc" do
    assert_difference('Calc.count', -1) do
      delete :destroy, id: @calc
    end

    assert_redirected_to calcs_path
  end
end
