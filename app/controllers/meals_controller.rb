class MealsController < ApplicationController

  def new
    @meal = Meal.new
    @members = Member.all
    @day =params[:day]
    @month = params[:month]
    @year = params[:year]
    @date =@year+"-"+@month+"-"+@day
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index

  end

  def edit
   # @member = Meal.where("day=?",params[:day])
   @member_per_meal = params[:memberpermeal]
   @day = params[:id]
   @month = params[:month]
   @year = params[:year]
   @date =@year+"-"+@month+"-"+@day
   meals = Meal.all
   meals = meals.where("year = ?",@year)
   meals =meals.where("month = ?",@month)
   @meals =meals.where("day =?",@day)
   p @meals.length
    respond_to do |format|
      format.html
      format.js
    end
  end



  def create

    @members = Member.all
    @memberpermeal = {}
     params[:member_id].each_with_index do |member_id, index|
       if params[:quantity][index].present?
         quantity = params[:quantity][index]
       else
         quantity = 0
       end
       @meal=Meal.find_or_initialize_by(member_id: member_id,date: params[:date],month: params[:month],year: params[:year],day: params[:meal_day])
       @meal.quantity = quantity
       @meal.save
       @memberpermeal[member_id.to_i] = quantity
     end
  end




  def update

    @members = Member.all
    @memberpermeal = {}

    params[:member_id].each_with_index do |member_id, index|
       @meals =Meal.find_by(year: params[:year], month: params[:month], day: params[:meal_day],member_id: member_id )
       @memberpermeal[member_id.to_i] = params[:quantity][index]
      if @meals.quantity.present?
        @meals.update(member_id: member_id,quantity: params[:quantity][index],date: params[:date],month: params[:month],year: params[:year],day: params[:meal_day])


      end


       respond_to do |format|

           p "successful"
           format.js


       end
    end

    end

    private
    def meal_params
      params.require(:meal).permit(:quantity,:date,:month,:year)
    end

end
