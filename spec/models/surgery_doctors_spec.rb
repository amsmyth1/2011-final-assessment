require "rails_helper"
 describe SurgeryDoctors, type: :model do
    describe "relationships" do
       it {should belong_to(:surgery)}
       it {should belong_to(:doctor)}
    end
 end
