require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should get destroy" do
    get session_destroy_url
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'login_with_good_credentials' do
    get new_session_url, params: { login: 'nina@mail.ru', password_digest: '123456' }
    assert_response :success
  end

  test 'not_login_with_bad_credentials' do
    assert_raises 'InvalidHash' do
      post new_session_url, params: { login: 'nina_nina', password_digest: '123456' }
    end
  end

  test 'should_redirect_to_signin' do
    get '/method/input'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
