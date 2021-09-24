require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end


  test "should have a email" do
    user.email = "evanir.jr@gmail.com"
    assert_equal true, user.valid?
  end
 
  test "should have a error if email blank" do
    user.email = nil
    assert_equal false, user.valid?
    assert_equal ['não pode ficar em branco'], user.errors.messages[:email]
  end
 
  test "should have a error if name blank" do
    user.name = ""
    assert_equal false, user.valid?
    assert_equal ['não pode ficar em branco'], user.errors.messages[:name]
  end
 
  test "email should not have a specials characters" do
    user.email = "evanir&e8.com.br"
    assert_equal false, user.valid?
    assert_equal ['email invalido!'], user.errors.messages[:email]
  end






  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name, password: @user.password } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password: @user.password } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
