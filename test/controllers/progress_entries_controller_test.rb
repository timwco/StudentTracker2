require 'test_helper'

class ProgressEntriesControllerTest < ActionController::TestCase
  setup do
    @progress_entry = progress_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progress_entries)
  end

  test "should create progress_entry" do
    assert_difference('ProgressEntry.count') do
      post :create, progress_entry: {  }
    end

    assert_response 201
  end

  test "should show progress_entry" do
    get :show, id: @progress_entry
    assert_response :success
  end

  test "should update progress_entry" do
    put :update, id: @progress_entry, progress_entry: {  }
    assert_response 204
  end

  test "should destroy progress_entry" do
    assert_difference('ProgressEntry.count', -1) do
      delete :destroy, id: @progress_entry
    end

    assert_response 204
  end
end
