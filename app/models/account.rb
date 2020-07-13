# == Schema Information
#
# Table name: accounts
#
#  id           :integer          not null, primary key
#  amount       :integer          not null
#  end_time     :datetime
#  is_debit     :boolean          default(FALSE)
#  name         :string           not null
#  number       :string           not null
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
  before_validation :assign_number

  def withdrow_money(n)
    self.amount -= n
    self
  end

  def assign_number
    unless number.present?
      seed = DigitValue.sample(2,2)
      seed << seed.sum
      self.number = seed.map(&:to_s).join
    end
  end
end
