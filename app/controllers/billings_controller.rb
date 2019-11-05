class BillingsController < ApplicationController
  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month
    @billings = Billing.search(@month,@year)
    @billingexpense = Billing.billexpense(@month,@year)

  end

  def new
    @billing = Billing.new(month: params[:month],year: params[:year],date: Date.today)
  end

  def create
    @billing = Billing.create(bill_params)
  end

  def update
    @billing = Billing.find_by(id: params[:billing][:id])
    @billing.update(bill_params)

  end
  def show
   @unpaids = Billing.unpaid(params[:month],params[:year])
   @totalunpaid = Billing.totalunpaid(params[:month],params[:year])

   respond_to do |format|
     format.html do
       render template: "billings/show",
              layout: "voucher.html"
     end

     format.pdf do
       render pdf: "Invoice No. 1",
              page_size: 'A4',
              template: "billings/show.html.erb",
              layout: "pdf.html",
              orientation: "Landscape",
              lowquality: true,
              zoom: 1,
              dpi: 75
     end
   end




  end



  private

  def bill_params
    params.require(:billing).permit!
  end


end
