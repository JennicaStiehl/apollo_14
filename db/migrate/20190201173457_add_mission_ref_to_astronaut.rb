class AddMissionRefToAstronaut < ActiveRecord::Migration[5.1]
  def change
    add_reference :astronauts, :mission, foreign_key: true
  end
end
