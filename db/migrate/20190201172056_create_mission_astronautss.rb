class CreateMissionAstronautss < ActiveRecord::Migration[5.1]
  def change
    create_table :mission_astronauts do |t|
      t.references :mission, foreign_key: true
      t.references :astronaut, foreign_key: true
    end
  end
end
