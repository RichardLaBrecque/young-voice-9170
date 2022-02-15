require 'rails_helper'
# User Story 3 of 4
# As a visitor,
# When I visit '/students'
# I see a list of students and the number of professors each student has.
# (e.g. "Draco Malfoy: 5"
#      "Nymphadora Tonks: 10")
RSpec.describe "student index" do
  it 'has an index page to visit' do
    visit '/students'
    expect(current_path).to eq('/students')
  end

  it 'lists all students and profressor counts on index page' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
    visit '/students'
    expect(page).to have_content("Harry Potter: 3")

  end
end
