# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  credit_number   :string
#  id_name         :string
#  kana_name       :string
#  masked_password :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :accounts
  
  def self.generate_random_credit_number
    generate_credit_number(DigitValue.sample(3))
  end

  def self.generate_credit_number(seed)
    seed << seed.sum
    seed.map(&:to_s).join("-")
  end
end
