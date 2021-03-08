require "rails_helper"

describe Doctor, type: :model do
   describe "relationships" do
      it {should have_many(:surgery_doctors)}
      it {should have_many(:doctors).through(:surgery_doctors)}
   end
end
