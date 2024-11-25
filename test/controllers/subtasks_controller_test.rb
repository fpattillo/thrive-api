require "test_helper"

class SubtasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtask = subtasks(:one)
  end

  test "should get index" do
    get subtasks_url, as: :json
    assert_response :success
  end

  test "should create subtask" do
    assert_difference("Subtask.count") do
      post subtasks_url, params: { subtask: { completed: @subtask.completed, name: @subtask.name, task_id: @subtask.task_id } }, as: :json
    end

    assert_response :created
  end

  test "should show subtask" do
    get subtask_url(@subtask), as: :json
    assert_response :success
  end

  test "should update subtask" do
    patch subtask_url(@subtask), params: { subtask: { completed: @subtask.completed, name: @subtask.name, task_id: @subtask.task_id } }, as: :json
    assert_response :success
  end

  test "should destroy subtask" do
    assert_difference("Subtask.count", -1) do
      delete subtask_url(@subtask), as: :json
    end

    assert_response :no_content
  end
end
