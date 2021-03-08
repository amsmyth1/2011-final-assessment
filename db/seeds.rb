# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mer = Doctor.create!({name: "Meredith Grey", experience: 10, university: "Harvard University"})
alex = Doctor.create!({name: "Alex Kare", experience: 10, university: "Johns Hopkins University"})
bailey = Doctor.create!({name: "Miranda Bailey", experience: 20, university: "Stanford University"})
mcdreamy = Doctor.create!({name: "Derek McDreamy Shepherd", experience: 15, university: "University of Pennsylvania"})

surgery_1 = Surgery.create!({title: "Kidney Replacement", week_day: "tuesday", operating_room: 104})
surgery_2 = Surgery.create!({title: "Appendix", week_day: "wednesday", operating_room: 310})
surgery_3 = Surgery.create!({title: "Hip Replacement", week_day: "friday", operating_room: 420})
surgery_4 = Surgery.create!({title: "Cranial Inspection", week_day: "monday", operating_room: 108})
surgery_5 = Surgery.create!({title: "Funnybone", week_day: "thursday", operating_room: 104})

mer.surgeries << surgery_1
mer.surgeries << surgery_2
mer.surgeries << surgery_3
mer.surgeries << surgery_4

alex.surgeries << surgery_3
alex.surgeries << surgery_2
alex.surgeries << surgery_5
alex.surgeries << surgery_4

bailey.surgeries << surgery_4
bailey.surgeries << surgery_5

mcdreamy.surgeries << surgery_1
