class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :duration
      t.date :date

      t.timestamps
    end
  end
end
