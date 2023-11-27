class CreateCalories < ActiveRecord::Migration[6.0]
  def change
    create_table :calories do |t|
      t.string :name
      t.integer :monday, default: "0"
      t.integer :tuesday, default: "0"
      t.integer :wednesday, default: "0"
      t.integer :thursday, default: "0"
      t.integer :friday, default: "0"
      t.integer :saturday, default: "0"
      t.integer :sunday, default: "0"

      t.timestamps
    end
  end
end
