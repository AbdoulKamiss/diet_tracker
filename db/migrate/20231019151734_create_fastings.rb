class CreateFastings < ActiveRecord::Migration[6.0]
  def change
    create_table :fastings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :description, default: ""

      t.timestamps
    end
  end
end
