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

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def full_name_with_title
    "#{self.title.capitalize} #{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def position_specialty_clinic
    "#{self.position.capitalize} in #{self.specialties.first.name.capitalize} at #{self.clinic.name.capitalize}"
  end
end
