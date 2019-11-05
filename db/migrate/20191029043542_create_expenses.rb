class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :purpose
      t.integer :amount
      t.date :date
      t.string :year
      t.string :month

      t.timestamps
    end
  end
end
