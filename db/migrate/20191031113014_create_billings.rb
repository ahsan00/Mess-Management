class CreateBillings < ActiveRecord::Migration[5.0]
  def change
    create_table :billings do |t|
      t.string :purpose
      t.integer :amount
      t.date :date
      t.string :month
      t.string :year
      t.integer :status,default: 0
      t.timestamps
    end
  end
end
