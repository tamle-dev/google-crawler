class Keyword < ApplicationRecord
  has_many :keyword_details

  accepts_nested_attributes_for :keyword_details
end
