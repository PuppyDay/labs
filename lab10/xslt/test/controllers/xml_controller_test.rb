# frozen_string_literal: true

require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'check xml format' do
    get '/?v1=137&format=xml'
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end

  test 'check rss format' do
    get '/?v1=137&format=rss'
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end
