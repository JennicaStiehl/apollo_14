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
    it 'should return correct avg age' do
      @astronaut_1 = Astronaut.create(name: "Neil", age: 30, job: "Engineer")
      @astronaut_2 = Astronaut.create(name: "John", age: 50, job: "Engineer")

      avg_age = (@astronaut_1.age + @astronaut_2.age) / 2

      expect(Astronaut.avg_age).to eq(avg_age.to_f)
    end
  end

  describe 'instance methods' do

  end
end
