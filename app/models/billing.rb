class Billing < ApplicationRecord

  def self.search(month,year)
    billings = Billing.all
    billings = billings.where(["year LIKE ?",year]) if year.present?
    billings = billings.where(["month LIKE ?",month]) if month.present?
    billings = billings.order("created_at ASC")
  end


  def self.billexpense(month,year)
    totalbill = {}
    billings = Billing.where(month: month,year: year,status: 1)
    billingstotal = billings.sum(:amount)
    p "billingstotal"
    p billingstotal

    billings.each do |bill|
      totalbill[bill.id] = bill.amount
    end

  end

  def self.unpaid(month,year)
    billings = Billing.where(month: month,year: year,status: 0)
    p "billing"
    p billings
  end

  def self.totalunpaid(month,year)
    billings = Billing.where(month: month,year: year,status: 0)
    billingstotal = billings.sum(:amount)
    return billingstotal
  end


end
