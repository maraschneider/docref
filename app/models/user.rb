class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::module
  pg_search_scope :search_by_specialty_and_field,
    against: [:specialty, :field],
    using: {
      tsearch: { prefix: true }
    }
end
