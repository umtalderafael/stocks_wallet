require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @transaction = transactions(:one)
    sign_in_as users(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { amount: @transaction.amount, broker_id: @transaction.broker_id, date: @transaction.date, investment_id: @transaction.investment_id, transaction_type_id: @transaction.transaction_type_id, user_id: @transaction.user_id, value: @transaction.value } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { amount: @transaction.amount, broker_id: @transaction.broker_id, date: @transaction.date, investment_id: @transaction.investment_id, transaction_type_id: @transaction.transaction_type_id, user_id: @transaction.user_id, value: @transaction.value } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
