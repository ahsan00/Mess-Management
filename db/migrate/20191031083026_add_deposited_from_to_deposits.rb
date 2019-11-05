class AddDepositedFromToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :deposited_from, :string
  end
end
