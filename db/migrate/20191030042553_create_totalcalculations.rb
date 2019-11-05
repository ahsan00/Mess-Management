class CreateTotalcalculations < ActiveRecord::Migration[5.0]
  def change
    create_table :totalcalculations do |t|

      t.timestamps
    end
  end
end
