# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  end_date   :date
#  number     :string           not null
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#  branch_id  :integer
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_accounts_on_account_id  (account_id)
#  index_accounts_on_branch_id   (branch_id)
#  index_accounts_on_product_id  (product_id)
#  index_accounts_on_user_id     (user_id)
#
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
