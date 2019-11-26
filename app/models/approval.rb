class Approval < ApplicationRecord
  belongs_to :specialty
  belongs_to :giver_id, source: :users
  belongs_to :receiver_id, source: :users
  has_many :approval_fields
  has_many :fields, through: :approval_fields
end
