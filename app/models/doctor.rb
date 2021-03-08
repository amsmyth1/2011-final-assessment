class Doctor < ApplicationRecord
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors

end
