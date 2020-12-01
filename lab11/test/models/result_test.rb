# frozen_string_literal: true

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  test 'test_save_db' do
    instance = Result.new(value: 30, result: ActiveSupport::JSON.encode([15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984]))
    assert instance.save
    instance.delete
  end

  test 'test_unique_value' do
    instanse1 = Result.new(value: 3, result: ActiveSupport::JSON.encode([2.0, 1.75, 1.7321428571428572]))
    instanse1.save
    instance2 = Result.new(value: 3, result: ActiveSupport::JSON.encode([2.0, 1.75, 1.7321428571428572]))
    instance2.validate
    assert_equal instance2.errors[:value], ['has already been taken']
  end

  test 'test_get_db' do
    instance = Result.new(value: 30, result: ActiveSupport::JSON.encode([15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984]))
    assert instance.save
    assert_equal ActiveSupport::JSON.encode([15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984]), Result.find_by_value(30).result
  end

  test 'test_positive_value' do
    instance = Result.new(value: -4)
    instance.validate
    assert_equal instance.errors[:value], ['must be greater than 0']
  end
end
