# frozen_string_literal: true

require 'test_helper'

class MethodControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get method_input_url
    assert_response :success
  end

  test 'should get view' do
    get method_view_url
    assert_response :success
  end

  test 'test for a regular number' do
    get method_view_url, params: { v1: 4 }
    assert_in_delta assigns[:result], Math.sqrt(4), 0.001
  end

  test 'test for a number with an irrational root' do
    get method_view_url, params: { v1: 3 }
    assert_in_delta assigns[:result], Math.sqrt(3), 0.001
  end

  test 'test for a negative number' do
    get method_view_url, params: { v1: -3 }
    assert_equal assigns[:result], 'Введите положительное число'
  end

  test 'test for a string' do
    get method_view_url, params: { v1: 'hhh' }
    assert_equal assigns[:result], 'Введите положительное число'
  end
end
