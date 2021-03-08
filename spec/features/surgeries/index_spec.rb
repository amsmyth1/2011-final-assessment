require "rails_helper"

RSpec.describe "surgery index page", type: :feature do
   before :each do
     @mer = Doctor.create!({name: "Meredith Grey", experience: 10, university: "Harvard University"})
     @alex = Doctor.create!({name: "Alex Kare", experience: 10, university: "Johns Hopkins University"})
     @bailey = Doctor.create!({name: "Miranda Bailey", experience: 20, university: "Stanford University"})
     @mcdreamy = Doctor.create!({name: "Derek McDreamy Shepherd", experience: 15, university: "University of Pennsylvania"})
     @surgery_1 = Surgery.create!({title: "Kidney Replacement", week_day: "tuesday", operating_room: 104})
     @christina = Doctor.create!({name: "Christina Yang", experience: 9, university: "Stanford University"})

     @surgery_2 = Surgery.create!({title: "Appendix", week_day: "wednesday", operating_room: 310})
     @surgery_3 = Surgery.create!({title: "Hip Replacement", week_day: "friday", operating_room: 420})
     @surgery_4 = Surgery.create!({title: "Cranial Inspection", week_day: "monday", operating_room: 108})
     @surgery_5 = Surgery.create!({title: "Funnybone", week_day: "thursday", operating_room: 104})

     @mer.surgeries << @surgery_1
     @mer.surgeries << @surgery_2
     @mer.surgeries << @surgery_3
     @alex.surgeries << @surgery_1
     @alex.surgeries << @surgery_3
     @alex.surgeries << @surgery_5
     @bailey.surgeries << @surgery_1
     @bailey.surgeries << @surgery_2
     @bailey.surgeries << @surgery_3
     @bailey.surgeries << @surgery_4
     @bailey.surgeries << @surgery_5
     @mcdreamy.surgeries << @surgery_1
   end

  describe "user sees all surgeries Information" do
    it "displays the surgery title, day of the week, and operating room" do
      visit surgeries_path

      within "surgery-#{@surgery_1.id}" do
        expect(page).to have_content(@surgery_1.title)
        expect(page).to have_content(@surgery_1.week_day.titleize)
        expect(page).to have_content(@surgery_1.operating_room)
      end
      within "surgery-#{@surgery_2.id}" do
        expect(page).to have_content(@surgery_2.title)
        expect(page).to have_content(@surgery_2.week_day.titleize)
        expect(page).to have_content(@surgery_2.operating_room)
      end
      within "surgery-#{@surgery_3.id}" do
        expect(page).to have_content(@surgery_3.title)
        expect(page).to have_content(@surgery_3.week_day.titleize)
        expect(page).to have_content(@surgery_3.operating_room)
      end
    end
    it "displays the average years of experience of the operating doctors" do
      visit surgeries_path

      within "surgery-#{@surgery_3.id}" do
        expect(page).to have_content(@surgery_3.average_years_experience)
      end
    end
  end
end
