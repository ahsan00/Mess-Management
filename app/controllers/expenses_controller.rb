class ExpensesController < ApplicationController

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
    @expenses  = Expense.search(@month,@year)

  end

  def new
    @expense = Expense.new(year: params[:year], month: params[:month], date: Date.today)
  end

  def create
    @expense = Expense.create(expense_params)

  end

 def edit
   @expense = Expense.find_by(id: params[:id] )
   p "expense"
   p @expense
 end

  def update

    @expense = Expense.find_or_initialize_by(year: params[:expense][:year], month: params[:expense][:month],id: params[:id] )

       @expense.update(expense_params)
      

  end

  private

  def expense_params
    params.require(:expense).permit!
  end


end
