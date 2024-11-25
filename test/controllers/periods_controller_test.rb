require "test_helper"

class PeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get periods_url, as: :json
    assert_response :success
  end

  test "should create period" do
    assert_difference("Period.count") do
      post periods_url, params: { period: { completion: @period.completion, duration: @period.duration, name: @period.name } }, as: :json
    end

    assert_response :created
  end

  test "should show period" do
    get period_url(@period), as: :json
    assert_response :success
  end

  test "should update period" do
    patch period_url(@period), params: { period: { completion: @period.completion, duration: @period.duration, name: @period.name } }, as: :json
    assert_response :success
  end

  test "should destroy period" do
    assert_difference("Period.count", -1) do
      delete period_url(@period), as: :json
    end

    assert_response :no_content
  end
end
