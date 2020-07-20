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
  belongs_to :account
  has_many :accounts
end
