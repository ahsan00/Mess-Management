class Meal < ApplicationRecord
  belongs_to :member
  def self.permealcount(year,month,lastday)
    members = Member.all
    meals = Meal.all
    meals = meals.where(["year LIKE ?",year]) if year.present?
    meals = meals.where(["month LIKE ?",month]) if month.present?
    totalmeal ={}
    members.each do |member|
      individulameal = meals.where("member_id=?",member.id)
      sumofmeal = individulameal.sum(:quantity)
      index = member.id.to_i
      totalmeal[index] = sumofmeal
      p ">>>>>>>>>"

    end
     p totalmeal
    return totalmeal



    sum =0
    # for i in 1..lastday
    #   @member.each do |member|
    #     if memberpermeal[i].present? memberpermeal[i][member.id].present?
    #       sum = sum+memberpermeal[i][member.id]
    #     end
    #   end
    # end
  end

  def self.totalcount(year,month,lastday)
    member = Member.all
    meals = Meal.all
    meals = meals.where(["year LIKE ?",year]) if year.present?
    meals = meals.where(["month LIKE ?",month]) if month.present?
    totalmealofmonth ={}
      mealstotal = meals.sum(:quantity)
      return mealstotal


  end

  def self.update(year,month,lastday)

    meals = Meal.all
    meals = meals.where(["year LIKE ?",year]) if year.present?
    meals = meals.where(["month LIKE ?",month]) if month.present?

    format_meal = {}
    @meal = meals.group(['day', 'member_id']).sum('quantity')
    @meal.each do |key, value|
      day = key.first
      member = key.last
      if format_meal[day].present?
        format_meal[day][member.to_i] = value
      else
        format_meal[day] = {member.to_i => value}
      end
    end

    return format_meal
end

    sum =0
    # for i in 1..lastday
    #   @member.each do |member|
    #     if memberpermeal[i].present? memberpermeal[i][member.id].present?
    #       sum = sum+memberpermeal[i][member.id]
    #     end
    #   end
    # end
  end


