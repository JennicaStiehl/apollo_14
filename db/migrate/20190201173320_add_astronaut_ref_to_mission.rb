class AddAstronautRefToMission < ActiveRecord::Migration[5.1]
  def change
    add_reference :missions, :astronaut, foreign_key: true
  end
end
