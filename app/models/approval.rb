class Approval < ApplicationRecord
  belongs_to :specialty
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :approval_fields
  has_many :fields, through: :approval_fields

  accepts_nested_attributes_for :approval_fields

  include PgSearch::Model
  pg_search_scope :search_by_field,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }
end
