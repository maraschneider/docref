class Specialty < ApplicationRecord
  has_many :fields
  has_many :user_specialties
  has_many :users, through: :user_specialties
end
