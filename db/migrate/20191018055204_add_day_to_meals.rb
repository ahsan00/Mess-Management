class AddDayToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :day, :integer
  end
end
