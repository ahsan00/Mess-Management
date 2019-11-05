class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer :quantity
      t.string :date
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end