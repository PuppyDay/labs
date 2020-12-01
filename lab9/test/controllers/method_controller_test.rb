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
end
