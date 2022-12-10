require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe '#average_age' do
    it 'returns average age of all residents to the tenths place' do
      resident1 = Resident.create!(name: "Jessica Rabbit", age: 68, occupation: "Singer")
      resident2 = Resident.create!(name: "Seth Rogan", age: 43, occupation: "Comedian")
      resident3 = Resident.create!(name: "Miles Morales", age: 18, occupation: "Student/Spiderman")

      expect(Resident.average_age).to eq(43)

      resident4 = Resident.create!(name: "Bruce Chutback", age: 16, occupation: "Student/New Guy In Town")

      expect(Resident.average_age).to eq(36.3)
    end
  end
end
