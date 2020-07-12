# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  amount       :integer          not null
#  end_time     :datetime
#  name         :string           not null
#  start_time   :datetime
#  user_id_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  branch_id    :integer
#  user_id      :integer
#
# Indexes
#
#  index_accounts_on_branch_id  (branch_id)
#  index_accounts_on_user_id    (user_id)
#
class Account < ApplicationRecord
  belongs_to :branch
end
