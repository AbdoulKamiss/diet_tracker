class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.string :name
      t.float :monday, default: "0"
      t.float :tuesday, default: "0"
      t.float :wednesday, default: "0"
      t.float :thursday, default: "0"
      t.float :friday, default: "0"
      t.float :saturday, default: "0"
      t.float :sunday, default: "0"

      t.timestamps
    end
  end
end
