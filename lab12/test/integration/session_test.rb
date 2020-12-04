require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should login' do
    instance = User.new(email: 'da@a.a', password_digest: 'da')
    instance.save
    get signin_url
    assert_response :success
    post session_index_url, params: { session: { email: 'da@a.a', password: 'da' } }
    assert_response :success
  end
end
