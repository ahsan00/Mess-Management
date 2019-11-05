class AddMemberIdToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :member_id, :string
  end
end
