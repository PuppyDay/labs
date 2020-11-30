# frozen_string_literal: true

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  test 'test_set_and_get_db' do
    res = Result.create value: 30, result: ActiveSupport::JSON.encode([15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984])
    assert res.save
    o = Result.find_by_value(30)
    assert_equal [15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984], ActiveSupport::JSON.decode(o.result)
  end

  test 'test_uniq_value' do
    instance = Result.new(value: 30, result: ActiveSupport::JSON.encode([15.5, 8.717741935483872, 6.079500014920474, 5.507058168194934, 5.477306378956984]))
    instance.validate
    assert_equal instance.errors[:value], []
  end

end
