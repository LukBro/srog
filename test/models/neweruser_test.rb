require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @neweruser = Neweruser.new(name: 'Example User', email: 'user@example.com')
  end
  test 'should be valid' do
    assert @neweruser.valid?
  end
end
