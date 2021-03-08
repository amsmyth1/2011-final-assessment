class DoctorsController < ApplicationController

  def welcome
  end 

  def index
    @doctors = Doctor.all_by_experience
  end
end
