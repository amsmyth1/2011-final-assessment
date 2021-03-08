class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    # binding.pry
    @surgery = Surgery.find(params[:id])
    @surgery_doctors = @surgery.doctors
    @most_experience_doctor_on_surgery = @surgery_doctors.most_experience
    @least_experience_doctor_on_surgery = @surgery_doctors.least_experience
    if params["query"] != nil
      @search_doc_results = Doctor.search_results(params["query"])
    end
  end
end
