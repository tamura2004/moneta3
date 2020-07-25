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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "account form" do  
    form = users(:one).account_form(products(:one))
    assert form.is_a? AccountForm
    assert form.user_id == users(:one).id
    assert form.product_id == products(:one).id
  end

  test "has settlement account" do
    pp users(:akagi).accounts.settlement
    assert users(:akagi).accounts.settlement.count == 2
  end
end
