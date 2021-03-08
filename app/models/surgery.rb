class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors
end
