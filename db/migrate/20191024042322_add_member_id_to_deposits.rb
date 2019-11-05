class AddMemberIdToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :member_id, :integer
  end
end
