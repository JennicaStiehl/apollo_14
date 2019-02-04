require 'rails_helper'

describe 'As a Visitor' do
  before :each do
    @astronaut_1 = Astronaut.create(name: "Neil", age: 30, job: "Engineer")
    @astronaut_2 = Astronaut.create(name: "John", age: 50, job: "Engineer")
    @mission_1 = @astronaut_1.missions.create(title: "Mars", time_in_space: 400)
    @mission_2 = @astronaut_1.missions.create(title: "Jupiter", time_in_space: 4000)
    @mission_3 = @astronaut_2.missions.create(title: "Moon", time_in_space: 40)
end
  describe 'When I visit a astronauts index page' do
    it 'sees a list of astronauts with info' do

      visit astronauts_path

      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_2.age)
    end

    it 'sees the avg age of all astronauts' do

      visit astronauts_path

      expect(page).to have_content('Average Age 40')
    end


    it 'can list missions alphabetically' do

      visit astronauts_path

      expect(page).to have_content("Jupiter\nMars")
    end

    it 'can aggregate time in space' do
      visit astronauts_path

      expect(page).to have_content("Time in Space: 4400")
    end
  end
end
