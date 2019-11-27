class User < ApplicationRecord
  belongs_to :clinic
  has_many :user_specialties
  has_many :specialties, through: :user_specialties
  has_many :user_fields
  has_many :fields, through: :user_fields
  has_many :approvals, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #pg_search_scope :search_by_location,
  #  associated_against: {
  #    clinics: :address
  #  },
  #  using: {
  #    tsearch: { prefix: true }
  #  }
end
