# frozen_string_literal: true

require 'application_system_test_case'

class SessionTest < ApplicationSystemTestCase
  test 'test_no_signin' do
    visit signin_url
    fill_in 'Email', with: 'aaaaa'
    fill_in 'Password', with: 'aaaa'
    click_on 'Sign in'
    assert_text 'Invalid email/password combination.'
  end

  test 'test_sign_in' do
    User.new(email: 'user@example.com', password: 'password').save
    visit signin_url
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    assert_text 'Введите число, чтобы узнать его квадратный корень'
  end

  test 'test_registration' do
    visit signup_url
    fill_in 'user[name]', with: 'Nina'
    fill_in 'user[email]', with: 'nina@mail.ru'
    fill_in 'user[password]', with: '1234'
    click_on 'commit'
    assert_text 'Sign in'
  end

  test 'should do do do do' do
    User.new(email: 'user@example.com', password: 'password').save
    visit signin_url
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    fill_in 'v1', with: '100'
    click_on 'Calc result'
    assert_text 'Результат:'
  end
end