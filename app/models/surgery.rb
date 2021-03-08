class Surgery < ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def average_years_experience
    doctors.average_years_experience
  end

  def self.all_by_average_years_experience
  end 
end
