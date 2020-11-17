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
    rand_val = rand(1000.0)
    get method_view_url, params: { v1: rand_val }
    assert_in_delta assigns[:result], Math.sqrt(rand_val), 0.01
  end

  test 'test for a negative number' do
    rand_val = -1 * rand
    get method_view_url, params: { v1: rand_val }
    assert_nil assigns[:result]
  end

  test 'test for a string' do
    get method_view_url, params: { v1: 'hhh' }
    assert_nil assigns[:result]
  end
end
