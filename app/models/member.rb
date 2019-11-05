class Member < ApplicationRecord
  has_many :meals
  has_many :deposits
  MONTH_LIST = [["January", 1],["February",2],["March",3],["April",4],["May",5],["June",6],["July",7],["August",8],["September",9],["October",10],["November",11],["December",12]]
  YEAR_LIST = [2019,2018,2017,2016,2015,2014,2013,2012,2011,2010]

  def self.dimension(year,month,lastday)

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

    p format_meal
    p format_meal[1][1]
    #@meals = @meal.all.group_by(&:member_id)
    #p "this today"
    # h1 = Hash.new
    # #p @meal
    # for i in 1..3
    #
    #   dd = Meal.where('day = ?',i)
    #    dd.map do |c|
    #      p c.member_id
    #      p c.day
    #      h1 = {
    #          c.day => c.quantity
    #      }
    #    end
    # end
    #
    #
    # h1.each do |key,value|
    #   p "value"
    #   p h1[1]
    # end


    # @meal.each do |date,value1|
    #   p "date"
    #   p date
    #   member_id.each do |memeber_id,value2|
    #     p memeber_id
    #     value2.each do |value|
    #       p value.quantity
    #     end
    #   end
    # end

    #@member = Member.all

   # array = []
   #  for i in 1..lastday
   #    array[i]=[]
   #    for j in 1..@member.length
   #      array[i][j] =0
   #    end
   #
   #  end

    #dimension = Hash.new

    # @meal.each do |meal|
    #
    #   p ">>>>>>"
    #    p day = meal.day
    #   p ">>>>>>"
    #    member_id1 =meal.member_id.to_i
    #    dimension = {
    #
    #        day => {
    #            member_id1 => meal.quantity
    #
    #        }
    #
    #    }
    # end

      # dimension.each do |key,value|
      #
      #   value.each do |key2,value|
      #      p "This is hash"
      #     p value
      #
      #   end
      #
      # end


    #
    #   for i in 1..lastday
    #     array[i] =[]
    #     for j in 1..@member.length
    #
    #       if(i==day && j==member_id1)
    #         array[i][j] = meal.quantity
    #          break
    #       else
    #         array[i][j] = 0
    #       end
    #     end
    #   end


    # p "hash value"
    # #p dimension[1][1]
    # dimension.each do |key,value|
    #
    #     value.each do |key2,value|
    #        p "This is hash"
    #       p value
    #     end
    #
    #   end


      #p array.inspect

  end

end
