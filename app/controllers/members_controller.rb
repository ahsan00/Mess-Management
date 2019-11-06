class MembersController < ApplicationController

  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.all
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
    @startdate = Date.new( @year.to_i,@month.to_i,1)
    @lastday = @startdate.end_of_month.day
    @memberpermeal = Member.dimension(@year,@month,@lastday)
    @permealcount = Meal.permealcount(@year,@month,@lastday)
    @totalmealcount = Meal.totalcount(@year,@month,@lastday)
  end

  def new
    @member = Member.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create

    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path }
      else
        format.html { render :new }
      end
    end




  end

  def show

  end

  def edit
    @member = Member.find_by(id: params[:id])
  end

  def update
    @member = Member.find_by(id: params[:id])

    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name,:email,:phone,:status)
  end


end
