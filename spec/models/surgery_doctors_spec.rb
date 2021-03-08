require "rails_helper"
 describe SurgeryDoctor, type: :model do
    describe "relationships" do
       it {should belong_to(:surgery)}
       it {should belong_to(:doctor)}
    end
 end
