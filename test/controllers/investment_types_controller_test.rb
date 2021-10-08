require 'test_helper'

class InvestmentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investment_type = investment_types(:one)
  end

  test "should get index" do
    get investment_types_url
    assert_response :success
  end

  test "should get new" do
    get new_investment_type_url
    assert_response :success
  end

  test "should create investment_type" do
    assert_difference('InvestmentType.count') do
      post investment_types_url, params: { investment_type: { description: @investment_type.description, name: @investment_type.name } }
    end

    assert_redirected_to investment_type_url(InvestmentType.last)
  end

  test "should show investment_type" do
    get investment_type_url(@investment_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_investment_type_url(@investment_type)
    assert_response :success
  end

  test "should update investment_type" do
    patch investment_type_url(@investment_type), params: { investment_type: { description: @investment_type.description, name: @investment_type.name } }
    assert_redirected_to investment_type_url(@investment_type)
  end

  test "should destroy investment_type" do
    assert_difference('InvestmentType.count', -1) do
      delete investment_type_url(@investment_type)
    end

    assert_redirected_to investment_types_url
  end
end
