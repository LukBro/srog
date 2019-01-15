require 'test_helper'

class WitajControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get witaj_index_url
    assert_response :success
  end
end
