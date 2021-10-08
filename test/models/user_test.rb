require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
  def user
    @user = users(:one)
  end
 
  test 'should have a email' do
    user.email = 'evanir.jr@gmail.com'
    assert_equal true, user.valid?
  end
 
  test 'should have a error if email blank' do
    user.email = nil
    assert_equal false, user.valid?
    assert_equal ['não pode ficar em branco'], user.errors.messages[:email]
  end
 
  test 'should have a error if name blank' do
    user.name = ''
    assert_equal false, user.valid?
    assert_equal ['não pode ficar em branco'], user.errors.messages[:name]
  end
 
  INVALID_CARACTERS = [' ', '!', '#', '$', '%', '&', '*', '(', ')', '+', '=', ':', ';', ',', '<', '>', '?', '/', '{', '}', '\[', '\]', '\\', ',', '"', '`', '~','@@', '..', 'ç', 'á', 'é', 'í', 'ó', 'ú', 'â', 'ô', 'ê', 'ã', 'õ'].freeze
 
  test 'email should not have a specials caracters' do
    INVALID_CARACTERS.each do |ic|
      user.email = "evanir#{ic}@tst.com.br"
      assert_equal false, user.valid?
      assert_equal true, user.errors.messages[:email].include?('caracter invalido!')
    end
  end
 
  test 'Not should allow @@' do
    user.email = 'evanir@@gmail.com'
    assert_equal false, user.valid?
    assert_equal ['não é válido', 'caracter invalido!'], user.errors.messages[:email]
  end
 
  test 'not should allow invalid hosts' do
    %w[gmail.com.br hotmail.com.br].each do |invalid_host|
      user.email = "evanir@#{invalid_host}"
      assert_equal false, user.valid?
      assert_equal ['host invalido!'], user.errors.messages[:email]
    end
  end
 
  test 'email should be valid' do
    wrongs_emails = ['evanir', 'evanir@qqcoisa', 'evanir@qqcoisa.']
    wrongs_emails.each do |we|
      user.email = we
      assert_equal false, user.valid?
      assert_equal ['não é válido'], user.errors.messages[:email]
    end
  end

end
