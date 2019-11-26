class Approval < ApplicationRecord
  belongs_to :specialty
  has_many :giver_id, source: :users
  has_many :receiver_id, source: :users
  has_many :approval_fields
  has_many :fields, through: :approval_fields
end
