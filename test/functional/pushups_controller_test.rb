require 'test_helper'

class PushupsControllerTest < ActionController::TestCase
  setup do
    @pushup = pushups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pushups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pushup" do
    assert_difference('Pushup.count') do
      post :create, pushup: @pushup.attributes
    end

    assert_redirected_to pushup_path(assigns(:pushup))
  end

  test "should show pushup" do
    get :show, id: @pushup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pushup.to_param
    assert_response :success
  end

  test "should update pushup" do
    put :update, id: @pushup.to_param, pushup: @pushup.attributes
    assert_redirected_to pushup_path(assigns(:pushup))
  end

  test "should destroy pushup" do
    assert_difference('Pushup.count', -1) do
      delete :destroy, id: @pushup.to_param
    end

    assert_redirected_to pushups_path
  end
end
