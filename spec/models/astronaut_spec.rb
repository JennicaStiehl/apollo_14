require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do

  end

  describe 'instance methods' do
    it 'can list missions alphabetically' do
      astronaut_1 = Astronaut.create(name: "Neil", age: 30, job: "Engineer")
      astronaut_2 = Astronaut.create(name: "John", age: 50, job: "Engineer")
      mission_1 = astronaut_1.missions.create(title: "Mars", time_in_space: 400)
      mission_2 = astronaut_1.missions.create(title: "Jupiter", time_in_space: 4000)
      mission_3 = astronaut_2.missions.create(title: "Moon", time_in_space: 40)

      expect(astronaut_1.alphabetical_missions).to eq('mission_2.title, mission_1.title')
    end
  end
end
