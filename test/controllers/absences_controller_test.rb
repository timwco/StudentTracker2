require 'test_helper'

class AbsencesControllerTest < ActionController::TestCase
  setup do
    @absence = absences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absences)
  end

  test "should create absence" do
    assert_difference('Absence.count') do
      post :create, absence: { date: @absence.date, reason: @absence.reason }
    end

    assert_response 201
  end

  test "should show absence" do
    get :show, id: @absence
    assert_response :success
  end

  test "should update absence" do
    put :update, id: @absence, absence: { date: @absence.date, reason: @absence.reason }
    assert_response 204
  end

  test "should destroy absence" do
    assert_difference('Absence.count', -1) do
      delete :destroy, id: @absence
    end

    assert_response 204
  end
end
