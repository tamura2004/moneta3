# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  memo       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_issues_on_state_id  (state_id)
#  index_issues_on_user_id   (user_id)
#
# Foreign Keys
#
#  state_id  (state_id => states.id)
#  user_id   (user_id => users.id)
#
require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  setup do
    @issue = Issue.new do |i|
      i.name = "表示されない"
      i.memo = "画面が真っ白になる"
      i.user = users(:akagi)
      i.state = states(:reported)
    end
  end

  test "適正である" do
    assert @issue.valid?
  end

  test "タイトルが必要" do
    @issue.name = nil
    assert @issue.invalid?
  end

  test "内容が必要" do
    @issue.memo = nil
    assert @issue.invalid?
  end

  test "ユーザーが必要" do
    @issue.user = nil
    assert @issue.invalid?
  end

  test "状態が必要" do
    @issue.state = nil
    assert @issue.invalid?
  end

  test "ユーザーに属する" do
    assert_respond_to @issue, :user
  end

  test "状態に属する" do
    assert_respond_to @issue, :state
  end
end
