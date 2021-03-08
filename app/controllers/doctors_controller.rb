class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all_by_experience
  end
end
