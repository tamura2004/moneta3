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
  setup do
    @state = State.new(name: "状態名")
  end

  test "適正である" do
    assert @state.valid?
  end

  test "名前が必要" do
    @state.name = nil
    assert @state.invalid?
  end

  test "報告を持つ" do
    assert_respond_to @state, :issues
  end
end
