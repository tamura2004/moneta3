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
# 課題
#
# @auther tamura2004@gmail.com
# @attribute id [String] レコードの主キー
# @attribute memo [String] 説明
# @attribute name [String] 項目名
# @attribute created_at [String] レコードの作成時刻
# @attribute updated_at [String] レコードの更新時刻
# @attribute state_id [String] 状態レコードの外部キー
# @attribute user_id [String] 作成ユーザーの外部キー
class Issue < ApplicationRecord
  # 一つの状態を持つ
  belongs_to :state

  # 一つの作成ユーザーを持つ
  belongs_to :user

  # 項目名と説明は空であってはならない
  validates :name, :memo, presence: true
end
