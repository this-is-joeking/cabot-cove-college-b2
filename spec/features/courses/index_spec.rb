require 'rails_helper'

RSpec.describe 'courses index page' do
  it 'lists all courses and the number of students enrolled' do
    resident1 = Resident.create!(name: "Jessica Rabbit", age: 68, occupation: "Singer")
    resident2 = Resident.create!(name: "Seth Rogan", age: 43, occupation: "Comedian")
    resident3 = Resident.create!(name: "Miles Morales", age: 18, occupation: "Student/Spiderman")
    course1 = resident1.courses.create!(name: 'Geometry')
    course2 = resident1.courses.create!(name: 'Intro to Humanology')
    course3 = resident1.courses.create!(name: 'Study of Ant Anatomy: Antnatomy')
    resident2.courses << course1
    course4 = resident2.courses.create!(name: 'Intro to Psych(the show)')
    course5 = resident2.courses.create!(name: 'Dog Whispering')
    resident3.courses << course1
    resident3.courses << course3
    resident3.courses << course4

    visit '/courses'
    
    expect(page).to have_content(course1.name)
    expect(page).to have_content(course2.name)
    expect(page).to have_content(course3.name)
    expect(page).to have_content(course4.name)
    expect(page).to have_content(course5.name)
    expect(page).to have_content("Geometry: 3")
    expect(page).to have_content("Intro to Humanology: 1")
    expect(page).to have_content("Intro to Psych(the show): 2")
  end
end