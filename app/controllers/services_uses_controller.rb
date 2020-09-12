class ServicesUsesController < ApplicationController
  def index
    @services_uses = ServicesUse.all
  end

  def show
    @services_use = ServicesUse.find params[:id]
  end

  def new
    @services_use = ServicesUse.new
  end

  def create
    @services_use = ServicesUse.new services_use_params

    if @services_use.save
      flash[:notice] = 'Uso do Serviço criado com sucesso!'
      redirect_to services_uses_path
    else
      render :new
    end
  end

  def edit
    @services_use = ServicesUse.find params[:id]
  end

  def update
    @services_use = ServicesUse.find params[:id]

    if @services_use.update services_use_params
      flash[:notice] = 'Uso do Serviço atualizado com sucesso!'
      redirect_to services_uses_path
    else
      render :edit
    end
  end

  def destroy
    @services_use = ServicesUse.find params[:id]
    @services_use.destroy
    flash[:notice] = 'Uso do Serviço excluído com sucesso!'
    redirect_to services_uses_path
  end

  private

  def services_use_params
    params.require(:services_use).permit :booking_id, :service_id, :used_at
  end
end
