class Specialty < ApplicationRecord
  has_many :fields
  has_many :user_specialties
  has_many :users, through: :user_specialties

  include PgSearch::Model
  pg_search_scope :search_by_specialty,
    against: :name,
    using: {
      tsearch: { prefix: true, dictionary: "english" }
    }
end
