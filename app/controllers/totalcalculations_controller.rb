class TotalcalculationsController < ApplicationController

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
   @mealrate = Totalcalculation.calcultation(@month,@year)
  end

  def show
    @members = Member.all
    @membertoalmeal = Totalcalculation.membertotal(params[:month],params[:year])
    @mebertotaldeposit = Totalcalculation.memberdeposit(params[:month],params[:year])
    @afterdepositadd = Totalcalculation.memberafterdeposit(params[:month],params[:year])

  end


 end
