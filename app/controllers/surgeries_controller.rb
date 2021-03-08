class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @surgery_doctors = @surgery.doctors
    @most_experience_doctor_on_surgery = @surgery_doctors.most_experience
    @least_experience_doctor_on_surgery = @surgery_doctors.least_experience
    if params["query"] != nil
      @search_doc_results = Doctor.search_results(params["query"])
    else
      @search_doc_results = []
    end
  end

  def create
    surgery = Surgery.find(params["surgery_id"])
    surgery_doc = SurgeryDoctor.new({surgery_id: params["surgery_id"], doctor_id: params["doctor_id"]})
    surgery_doc.save

    redirect_to surgery_path(surgery)
  end
end
