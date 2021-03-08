class Doctor < ApplicationRecord
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors

  def self.all_by_experience
    self.all.order(experience: :desc)
  end
end
