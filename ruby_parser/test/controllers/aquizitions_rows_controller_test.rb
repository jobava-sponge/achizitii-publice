require 'test_helper'

class AquizitionsRowsControllerTest < ActionController::TestCase
  setup do
    @aquizitions_row = aquizitions_rows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aquizitions_rows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aquizitions_row" do
    assert_difference('AquizitionsRow.count') do
      post :create, aquizitions_row: { file_lines: @aquizitions_row.file_lines, id: @aquizitions_row.id }
    end

    assert_redirected_to aquizitions_row_path(assigns(:aquizitions_row))
  end

  test "should show aquizitions_row" do
    get :show, id: @aquizitions_row
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aquizitions_row
    assert_response :success
  end

  test "should update aquizitions_row" do
    patch :update, id: @aquizitions_row, aquizitions_row: { file_lines: @aquizitions_row.file_lines, id: @aquizitions_row.id }
    assert_redirected_to aquizitions_row_path(assigns(:aquizitions_row))
  end

  test "should destroy aquizitions_row" do
    assert_difference('AquizitionsRow.count', -1) do
      delete :destroy, id: @aquizitions_row
    end

    assert_redirected_to aquizitions_rows_path
  end
end
