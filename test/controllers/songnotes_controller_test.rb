require 'test_helper'

class SongnotesControllerTest < ActionController::TestCase
  setup do
    @songnote = songnotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songnotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create songnote" do
    assert_difference('Songnote.count') do
      post :create, songnote: { measure: @songnote.measure, note: @songnote.note, page: @songnote.page, songtitle: @songnote.songtitle, xcoordinate: @songnote.xcoordinate, ycoordinate: @songnote.ycoordinate }
    end

    assert_redirected_to songnote_path(assigns(:songnote))
  end

  test "should show songnote" do
    get :show, id: @songnote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @songnote
    assert_response :success
  end

  test "should update songnote" do
    patch :update, id: @songnote, songnote: { measure: @songnote.measure, note: @songnote.note, page: @songnote.page, songtitle: @songnote.songtitle, xcoordinate: @songnote.xcoordinate, ycoordinate: @songnote.ycoordinate }
    assert_redirected_to songnote_path(assigns(:songnote))
  end

  test "should destroy songnote" do
    assert_difference('Songnote.count', -1) do
      delete :destroy, id: @songnote
    end

    assert_redirected_to songnotes_path
  end
end
