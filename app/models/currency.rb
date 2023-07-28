# == Schema Information
#
# Table name: currencies
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  rate_max    :float
#  rate_min    :float
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# 通貨モデル
class Currency < ApplicationRecord
  # 為替レート変更履歴を持つ
  has_many :rates, dependent: :destroy
end
