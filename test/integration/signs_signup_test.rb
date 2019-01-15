require 'test_helper'

class SignsSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'Sign.count' do
      post signs_path, params: { sign: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
    assert_template 'signs/new'
  end
end
