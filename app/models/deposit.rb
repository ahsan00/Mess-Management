class Deposit < ApplicationRecord
  belongs_to :member
    def self.search(month,year)
      members = Member.all
      balances = Deposit.all
      balances = balances.where(["year LIKE ?",year]) if year.present?
      balances = balances.where(["month LIKE ?",month]) if month.present?
      totalbalance ={}
      members.each do |member|
        individulameal = balances.where("member_id=?",member.id)
        sumofmeal = individulameal.sum(:balance)
        index = member.id.to_i
        totalbalance[index] = sumofmeal
        p ">>>>>>>>>"

      end
      p "deposit"
      p totalbalance
    end


end
