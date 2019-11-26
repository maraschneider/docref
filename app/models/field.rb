class Field < ApplicationRecord
  belongs_to :specialty
  has_many :approval_fields
  has_many :approvals, through: :approval_fields
  has_many :user_fields
  has_many :users, through: :user_fields
end
