require "rails_helper"

RSpec.describe "surgery show page", type: :feature do
   before :each do
     @mer = Doctor.create!({name: "Meredith Grey", experience: 10, university: "Harvard University"})
     @alex = Doctor.create!({name: "Alex Kare", experience: 10, university: "Johns Hopkins University"})
     @bailey = Doctor.create!({name: "Miranda Bailey", experience: 20, university: "Stanford University"})
     @mcdreamy = Doctor.create!({name: "Derek McDreamy Shepherd", experience: 15, university: "University of Pennsylvania"})
     @surgery_1 = Surgery.create!({title: "Kidney Replacement", week_day: "tuesday", operating_room: 104})
     @christina = Doctor.create!({name: "Christina Yang", experience: 9, university: "Stanford University"})

     @mer.surgeries << @surgery_1
     @alex.surgeries << @surgery_1
     @bailey.surgeries << @surgery_1
   end

describe "user sees all surgery Information" do
  it "displays the surgery title, day of the week, and operating room" do
    visit surgery_path(@surgery_1)

    expect(page).to have_content(@surgery_1.title)
    expect(page).to have_content(@surgery_1.week_day.titleize)
    expect(page).to have_content(@surgery_1.operating_room)
  end
  it "displays all doctors working on the surgery info" do
      visit surgery_path(@surgery_1)

      within ".surgery_information" do
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
    end
  describe "displays 2 sections" do
    it "displays 'Most Experienced Doctor'" do
        visit surgery_path(@surgery_1)

        within "#most_experience" do
          expect(page).to have_content(@bailey.name)
          expect(page).to have_content(@bailey.experience)
        end
    end
    it "displays 'Least Experienced Doctor'" do
        visit surgery_path(@surgery_1)

        within "#least_experience" do
          expect(page).to have_content(@alex.name)
          expect(page).to have_content(@alex.experience)
        end
      end
    end
  end
  describe "add a doctor to a surgery" do
    it "has a field to add a doctor by name to this surgery" do
      visit surgery_path(@surgery_1)
      save_and_open_page
      expect(page).to have_content("Add Doctor")
      expect(page).to have_button("Add Doctor")

      fill_in "Doctor", with: "ristina"
      click_on "Search"
      save_and_open_page
      click_on "Add Christina"

      expect(current_path).to eq(surgery_path(@surgery_1))
      within "#least_experience" do
        expect(page).to have_content(@christina.name)
        expect(page).to have_content(@christina.experience)
      end
    end
  end
end
