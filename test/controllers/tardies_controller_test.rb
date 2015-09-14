require 'test_helper'

class TardiesControllerTest < ActionController::TestCase
  setup do
    @tardy = tardies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tardies)
  end

  test "should create tardy" do
    assert_difference('Tardy.count') do
      post :create, tardy: { date: @tardy.date, less_than_15: @tardy.less_than_15, reason: @tardy.reason }
    end

    assert_response 201
  end

  test "should show tardy" do
    get :show, id: @tardy
    assert_response :success
  end

  test "should update tardy" do
    put :update, id: @tardy, tardy: { date: @tardy.date, less_than_15: @tardy.less_than_15, reason: @tardy.reason }
    assert_response 204
  end

  test "should destroy tardy" do
    assert_difference('Tardy.count', -1) do
      delete :destroy, id: @tardy
    end

    assert_response 204
  end
end
