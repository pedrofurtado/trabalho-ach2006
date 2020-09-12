class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      flash[:notice] = "Fatura criada com sucesso!"
      redirect_to invoices_path
    else
      render :new
    end
  end

  def update
    @invoice = Invoice.find params[:id]

    if @invoice.update invoice_params
      flash[:notice] = 'Fatura atualizada com sucesso!'
      redirect_to invoices_path
    else
      render :edit
    end
  end

  def destroy
    @invoice = Invoice.find params[:id]
    @invoice.destroy
    flash[:notice] = 'Fatura excluída com sucesso!'
    redirect_to invoices_path
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit :total_value, :payment_type, :booking_id, :employee_id
  end
end
