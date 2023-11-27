require "test_helper"

class IndicatorsListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indicators_list = indicators_lists(:one)
  end

  test "should get index" do
    get indicators_lists_url, as: :json
    assert_response :success
  end

  test "should create indicators_list" do
    assert_difference("IndicatorsList.count") do
      post indicators_lists_url, params: { indicators_list: { name: @indicators_list.name, precision: @indicators_list.precision } }, as: :json
    end

    assert_response :created
  end

  test "should show indicators_list" do
    get indicators_list_url(@indicators_list), as: :json
    assert_response :success
  end

  test "should update indicators_list" do
    patch indicators_list_url(@indicators_list), params: { indicators_list: { name: @indicators_list.name, precision: @indicators_list.precision } }, as: :json
    assert_response :success
  end

  test "should destroy indicators_list" do
    assert_difference("IndicatorsList.count", -1) do
      delete indicators_list_url(@indicators_list), as: :json
    end

    assert_response :no_content
  end
end
