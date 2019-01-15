require 'test_helper'
class SignsTest < ActiveSupport::TestCase
  def setup
    @sign = Sign.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end
  test 'should be valid' do
    assert @sign.valid?
  end
  test 'name should be present' do
    @sign.name = ' '
    assert_not @sign.valid?
  end
  test 'email should be present' do
    @sign.email = ' '
    assert_not @sign.valid?
  end
  test 'name should not be too long' do
    @sign.name = 'a' * 41
    assert_not @sign.valid?
  end
  test 'email shoud not be too long' do
    @sign.email = 'a' * 41 + '@example.com'
    assert_not @sign.valid?
  end
  test 'email validation should accept valid address' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @sign.email = valid_address
      assert @sign.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @sign.email = invalid_address
      assert_not @sign.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test 'emai addresses should be unique' do
    duplicate_user = @sign.dup
    duplicate_user.email = @sign.email.upcase
    @sign.save
    assert_not duplicate_user.valid?
  end
  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @sign.email = mixed_case_email
    @sign.save
    assert_equal mixed_case_email.downcase, @sign.reload.email
  end
  test 'password shoud be present (nonblank)' do
    @sign.password = @sign.password_confirmation = ' ' * 6
    assert_not @sign.valid?
  end
  test 'password should hava a minimum length' do
    @sign.password = @sign.password_confirmation = 'a' * 5
    assert_not @sign.valid?
  end
end
