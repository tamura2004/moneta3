class TransferForm
  include ActiveModel::Model
  attr_accessor :from_id, :bank_id, :branch_id, :account_id, :amount, :memo
  attr_accessor :account_number
end
