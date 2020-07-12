# == Schema Information
#
# Table name: statements
#
#  id              :integer          not null, primary key
#  amount          :integer          not null
#  instrument_name :string           not null
#  user_id_name    :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Statement < ApplicationRecord
end
