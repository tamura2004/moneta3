# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  kana_name  :string
#  myself     :boolean          not null
#  name       :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy

  validates :name, :number,presence: true
  validates :myself, inclusion: { in: [true, false] }

  def self.me
    find_by(myself: true)
  end
end
