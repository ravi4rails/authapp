require 'test_helper'

class StudentTypesControllerTest < ActionController::TestCase
  setup do
    @student_type = student_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_type" do
    assert_difference('StudentType.count') do
      post :create, student_type: { name: @student_type.name, student_category_id: @student_type.student_category_id }
    end

    assert_redirected_to student_type_path(assigns(:student_type))
  end

  test "should show student_type" do
    get :show, id: @student_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_type
    assert_response :success
  end

  test "should update student_type" do
    patch :update, id: @student_type, student_type: { name: @student_type.name, student_category_id: @student_type.student_category_id }
    assert_redirected_to student_type_path(assigns(:student_type))
  end

  test "should destroy student_type" do
    assert_difference('StudentType.count', -1) do
      delete :destroy, id: @student_type
    end

    assert_redirected_to student_types_path
  end
end
