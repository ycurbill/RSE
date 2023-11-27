require "test_helper"

class IndicatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicator = indicators(:one)
  end

  test "should get index" do
    get indicators_url, as: :json
    assert_response :success
  end

  test "should create indicator" do
    assert_difference("Indicator.count") do
      post indicators_url, params: { indicator: { action_id: @indicator.action_id, name: @indicator.name, precision: @indicator.precision, value: @indicator.value } }, as: :json
    end

    assert_response :created
  end

  test "should show indicator" do
    get indicator_url(@indicator), as: :json
    assert_response :success
  end

  test "should update indicator" do
    patch indicator_url(@indicator), params: { indicator: { action_id: @indicator.action_id, name: @indicator.name, precision: @indicator.precision, value: @indicator.value } }, as: :json
    assert_response :success
  end

  test "should destroy indicator" do
    assert_difference("Indicator.count", -1) do
      delete indicator_url(@indicator), as: :json
    end

    assert_response :no_content
  end
end
