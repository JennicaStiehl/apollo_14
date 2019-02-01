class DropMissionAstronauts < ActiveRecord::Migration[5.1]
  def change
    drop_table :mission_astronauts
  end
end
