class DashboardsController < ApplicationController
  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
    @futuremonth = Time.now + 1.month
    @mealrate = Totalcalculation.calcultation(@month,@year)
    @members = Member.all
    @membertoalmeal = Totalcalculation.membertotal(@month,@year)
    @mebertotaldeposit = Totalcalculation.memberdeposit(@month,@year)
    @afterdepositadd = Totalcalculation.memberafterdeposit(@month,@year)
  end
end
