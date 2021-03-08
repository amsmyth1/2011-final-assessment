require "rails_helper"

RSpec.describe "doctors index page", type: :feature do
   before :each do
     @mer = Doctor.create!({name: "Meredith Grey", experience: 10, university: "Harvard University"})
     @alex = Doctor.create!({name: "Alex Kare", experience: 10, university: "Johns Hopkins University"})
     @bailey = Doctor.create!({name: "Miranda Bailey", experience: 20, university: "Stanford University"})
     @mcdreamy = Doctor.create!({name: "Derek McDreamy Shepherd", experience: 15, university: "University of Pennsylvania"})
   end

describe "user sees all doctors" do
  it "displays all doctors info" do

      visit doctors_path

      within "#doctor-#{@mer.id}" do
        expect(page).to have_content(@mer.name)
        expect(page).to have_content(@mer.experience)
        expect(page).to have_content(@mer.university)
      end
      within "#doctor-#{@alex.id}" do
        expect(page).to have_content(@alex.name)
        expect(page).to have_content(@alex.experience)
        expect(page).to have_content(@alex.university)
      end
      within "#doctor-#{@bailey.id}" do
        expect(page).to have_content(@bailey.name)
        expect(page).to have_content(@bailey.experience)
        expect(page).to have_content(@bailey.university)
      end
    end
  it "displays all doctors by most experience first" do

      visit doctors_path

      expect(@bailey.name).to appear_before(@mcdreamy.name, only_text: true)
      expect(@mcdreamy.name).to appear_before(@mer.name, only_text: true)
      expect(@mer.name).to appear_before(@alex.name, only_text: true)
    end
  end
end
