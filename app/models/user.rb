# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  id_name         :string
#  kana_name       :string
#  masked_password :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :integer
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#
# Foreign Keys
#
#  account_id  (account_id => accounts.id)
#
class User < ApplicationRecord
  # 一つの主口座を持つ
  belongs_to :account

  # 複数の口座を持つ
  has_many :accounts, dependent: :destroy

  # 複数の課題を持つ（開発者用）
  has_many :issues, dependent: :destroy

  # ログインID、氏名、マスク化パスワードは空であってはならない
  validates :id_name, :name, :masked_password, presence: true

  # 口座開設入力フォームを生成
  #
  # @return [AccountForm]
  def account_form(product)
    AccountForm.new.tap do |form|
      form.user_id = id
      form.product_id = product.id
    end
  end
end
