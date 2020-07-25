# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test "should not name be null" do
    assert !State.new.save
  end

  test "has many issues" do
    assert states(:one).issues
  end
end
