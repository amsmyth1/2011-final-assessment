require "rails_helper"

describe Doctor, type: :model do
  before :each do
    @mer = Doctor.create!({name: "Meredith Grey", experience: 10, university: "Harvard University"})
    @alex = Doctor.create!({name: "Alex Karev", experience: 10, university: "Johns Hopkins University"})
    @bailey = Doctor.create!({name: "Miranda Bailey", experience: 20, university: "Stanford University"})
    @mcdreamy = Doctor.create!({name: "Derek McDreamy Shepherd", experience: 15, university: "University of Pennsylvania"})
  end

   describe "relationships" do
      it {should have_many(:surgery_doctors)}
      it {should have_many(:surgeries).through(:surgery_doctors)}
   end

   describe "::class methods" do
     describe "all_by_experience" do
       it "orders all doctors by most experience first" do
         answer = [@bailey.name, @mcdreamy.name, @mer.name, @alex.name]

         expect(Doctor.all_by_experience.pluck(:name)).to eq(answer)
       end
     describe "most_experience" do
       it "returns the doctor with the most experience" do

         expect(Doctor.most_experience).to eq(@bailey)
       end
     end
     describe "least_experience" do
       it "returns the doctor with the most experience" do

         expect(Doctor.least_experience).to eq(@alex)
       end
     end
   end
 end
end
