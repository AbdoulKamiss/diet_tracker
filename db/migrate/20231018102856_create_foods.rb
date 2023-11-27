class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.float :protein
      t.float :carbohydrates
      t.float :fat

      t.timestamps
    end
  end
end
