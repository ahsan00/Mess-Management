class DepositsController < ApplicationController

  def new
    @deposit = Deposit.new(member_id: params[:member_id], year: params[:year], month: params[:month], date: Date.today)
  end

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
    @members = Member.all
    @membertotalbalnce = Deposit.search(@month,@year)
  end

  def create
    @deposit = Deposit.new(deposit_params)
     respond_to do |format|
         if @deposit.save
           format.js
         end
     end
  end

  def edit

   @deposits = Deposit.where(year: params[:year],month: params[:month],member_id: params[:id])
  end


  private

  def deposit_params
    params.require(:deposit).permit!
  end

end
