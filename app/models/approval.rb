class Approval < ApplicationRecord
  belongs_to :specialty
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :approval_fields, dependent: :destroy
  has_many :fields, through: :approval_fields

  validates :headline, :content, presence: true
  #validates :giver,
  #          uniqueness: {
  #            scope: [:receiver],
  #            message: "You have already written a recommendation for this doctor."
  #          }

  include PgSearch::Model
  pg_search_scope :search_approvals_by_keyword,
    against: [:headline, :content],
    using: {
      tsearch: { prefix: true, dictionary: "english" }
    }
end
