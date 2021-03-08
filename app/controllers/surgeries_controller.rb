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
      binding.pry
      @search_doc_results = Doctor.search_results(params["query"])
    else
      @search_doc_results = []
    end
  end
end
