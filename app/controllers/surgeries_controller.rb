class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @surgery_doctors = @surgery.doctors
    @most_experience_doctor_on_surgery = @surgery_doctors.most_experience
    @least_experience_doctor_on_surgery = @surgery_doctors.least_experience
  end
end
