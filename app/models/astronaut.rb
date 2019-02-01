class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :missions
  has_many :astronaut_missions

  def self.avg_age
    Astronaut.average(:age)
  end

  def alphabetical_missions
    self.missions.order(title: :asc)
  end
end
