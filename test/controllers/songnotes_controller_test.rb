require 'test_helper'

class SongnotesControllerTest < ActionController::TestCase
  setup do
    @song_note = songnotes(:one)
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
      post :create, songnote: { measure: @song_note.measure, note: @song_note.note, page: @song_note.page, songtitle: @song_note.songtitle, xcoordinate: @song_note.xcoordinate, ycoordinate: @song_note.ycoordinate }
    end

    assert_redirected_to songnote_path(assigns(:songnote))
  end

  test "should show songnote" do
    get :show, id: @song_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_note
    assert_response :success
  end

  test "should update songnote" do
    patch :update, id: @song_note, songnote: { measure: @song_note.measure, note: @song_note.note, page: @song_note.page, songtitle: @song_note.songtitle, xcoordinate: @song_note.xcoordinate, ycoordinate: @song_note.ycoordinate }
    assert_redirected_to songnote_path(assigns(:songnote))
  end

  test "should destroy songnote" do
    assert_difference('Songnote.count', -1) do
      delete :destroy, id: @song_note
    end

    assert_redirected_to songnotes_path
  end
end
