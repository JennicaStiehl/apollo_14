require 'rails_helper'

describe 'As a Visitor' do
  describe 'When I visit a astronauts index page' do
    it 'sees a list of astronauts with info' do
      astronaut_1 = Astronaut.create(name: "Neil", age: 35, job: "Engineer")
      astronaut_2 = Astronaut.create(name: "John", age: 35, job: "Engineer")
      astronaut_3 = Astronaut.create(name: "Sally", age: 35, job: "Engineer")

      visit astronauts_path

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_2.age)
      expect(page).to have_content(astronaut_3.job)
    end

    it 'sees the avg age of all astronauts do
      astronaut_1 = Astronaut.create(name: "Neil", age: 30, job: "Engineer")
      astronaut_2 = Astronaut.create(name: "John", age: 50, job: "Engineer")
      astronaut_3 = Astronaut.create(name: "Sally", age: 20, job: "Engineer")

      visit astronauts_path

      expect(page).to have_content('Average Age 33')
    end
  end
end
