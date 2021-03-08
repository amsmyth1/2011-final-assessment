class Doctor < ApplicationRecord
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors

  def self.all_by_experience
    self.all.order(experience: :desc, name: :desc)
  end

  def self.most_experience
    self.all.order(experience: :desc, name: :desc).first
  end
  
  def self.least_experience
    self.all.order(experience: :desc, name: :desc).last
  end

  def self.search_results(query)
    Doctor.where("lower(name) LIKE ?", "%#{query.downcase}")
  end
end
