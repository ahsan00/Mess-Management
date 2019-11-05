class Totalcalculation < ApplicationRecord

  def self.calcultation(month,year)
    meals =Meal.where(year: year, month: month)
    mealstotal = meals.sum(:quantity).to_f

    expens =Expense.where(year: year, month: month)
    expenstotal = expens.sum(:amount).to_f

    deposits =Deposit.where(year: year, month: month)
    depositstotal = deposits.sum(:balance).to_f

    billings = Billing.where(month: month,year: year,status: 0)
    billingstotal = billings.sum(:amount).to_f

    currentdeposit = depositstotal-expenstotal-billingstotal

    mealrate = expenstotal/mealstotal
     return mealrate,mealstotal,expenstotal,currentdeposit


  end

  def self.membertotal(month,year)
    members = Member.all
    meals =Meal.where(year: year, month: month)

    totalmeal ={}
    members.each do |member|
      individulameal = meals.where("member_id=?",member.id)
      sumofmeal = individulameal.sum(:quantity)
      index = member.id.to_i
      totalmeal[index] = sumofmeal


    end
    return totalmeal
  end

 def self.memberdeposit(month,year)
   members = Member.all
   deposits =Deposit.where(year: year, month: month)
   totaldeposit ={}

   members.each do |member|
     individuladeposit = deposits.where("member_id=?",member.id)
     sumofdeposit = individuladeposit.sum(:balance)
     index = member.id.to_i
     totaldeposit[index] = sumofdeposit

   end
   return totaldeposit

 end

  def self.memberafterdeposit(month,year)
    month = month.to_i+1
    p "month"
    p month
    members = Member.all
    deposits =Deposit.where(year: year, month: month)
    totaldeposit ={}

    members.each do |member|
      individuladeposit = deposits.where("member_id=?",member.id)
      sumofdeposit = individuladeposit.sum(:deposited_from).to_i
      index = member.id.to_i
      totaldeposit[index] = sumofdeposit

    end

    p  totaldeposit
    return totaldeposit



  end






end
