class Page < ApplicationRecord
  has_many :pages
  belongs_to :page, optional: true
end
