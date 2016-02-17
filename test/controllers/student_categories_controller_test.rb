require 'test_helper'

class StudentCategoriesControllerTest < ActionController::TestCase
  setup do
    @student_category = student_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_category" do
    assert_difference('StudentCategory.count') do
      post :create, student_category: { name: @student_category.name }
    end

    assert_redirected_to student_category_path(assigns(:student_category))
  end

  test "should show student_category" do
    get :show, id: @student_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_category
    assert_response :success
  end

  test "should update student_category" do
    patch :update, id: @student_category, student_category: { name: @student_category.name }
    assert_redirected_to student_category_path(assigns(:student_category))
  end

  test "should destroy student_category" do
    assert_difference('StudentCategory.count', -1) do
      delete :destroy, id: @student_category
    end

    assert_redirected_to student_categories_path
  end
end
