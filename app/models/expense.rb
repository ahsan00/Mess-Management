class Expense < ApplicationRecord

  def self.search(month,year)
    expenses = Expense.all
    expenses = expenses.where(["year LIKE ?",year]) if year.present?
    expenses = expenses.where(["month LIKE ?",month]) if month.present?
    expenses = expenses.order("created_at ASC")
  end


end
