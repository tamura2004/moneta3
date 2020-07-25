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
  test "can create account form" do  
    form = users(:akagi).account_form(products(:futsu))
    assert form.is_a? AccountForm
    assert form.user_id == users(:akagi).id
    assert form.product_id == products(:futsu).id
  end

  test "has settlement account" do
    assert users(:akagi).accounts.settlement.count == 1
  end
end
