require 'rails_helper'

describe 'As a Visitor' do
  before :each do
    @astronaut_1 = Astronaut.create(name: "Neil", age: 30, job: "Engineer")
    @astronaut_2 = Astronaut.create(name: "John", age: 50, job: "Engineer")
    @astronaut_3 = Astronaut.create(name: "Sally", age: 20, job: "Engineer")
    @mission_1 = @astronaut_1.missions.create(title: "Mars", time_in_space: 400)
    @mission_2 = @astronaut_1.missions.create(title: "Jupiter", time_in_space: 4000)
    @mission_3 = @astronaut_2.missions.create(title: "Moon", time_in_space: 40)
end
  describe 'When I visit a astronauts index page' do
    it 'sees a list of astronauts with info' do

      visit astronauts_path

      expect(page).to have_content(@astronaut_1.name)
      expect(page).to have_content(@astronaut_2.age)
      expect(page).to have_content(@astronaut_3.job)
    end

    it 'sees the avg age of all astronauts' do

      visit astronauts_path

      expect(page).to have_content('Average Age 33')
    end

    it 'sees a list of missions in alphabetical order for each astronaut' do

      visit astronauts_path

      within("#astronaut-#{@astronauts.id}") do
        expect(page).to have_content('@mission_2.title, @mission_1.title')
      end
    end
  end
end
