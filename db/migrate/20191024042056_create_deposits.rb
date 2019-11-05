class CreateDeposits < ActiveRecord::Migration[5.0]
  def change
    create_table :deposits do |t|
      t.string :year
      t.string :month
      t.date :date
      t.integer :balance

      t.timestamps
    end
  end
end
