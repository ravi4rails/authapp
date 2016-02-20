require 'test_helper'

class AssignmentTasksControllerTest < ActionController::TestCase
  setup do
    @assignment_task = assignment_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignment_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment_task" do
    assert_difference('AssignmentTask.count') do
      post :create, assignment_task: { assignment_id: @assignment_task.assignment_id, description: @assignment_task.description, title: @assignment_task.title }
    end

    assert_redirected_to assignment_task_path(assigns(:assignment_task))
  end

  test "should show assignment_task" do
    get :show, id: @assignment_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignment_task
    assert_response :success
  end

  test "should update assignment_task" do
    patch :update, id: @assignment_task, assignment_task: { assignment_id: @assignment_task.assignment_id, description: @assignment_task.description, title: @assignment_task.title }
    assert_redirected_to assignment_task_path(assigns(:assignment_task))
  end

  test "should destroy assignment_task" do
    assert_difference('AssignmentTask.count', -1) do
      delete :destroy, id: @assignment_task
    end

    assert_redirected_to assignment_tasks_path
  end
end
