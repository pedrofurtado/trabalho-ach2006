class EnvironmentsUsesController < ApplicationController
  def index
    @environments_uses = EnvironmentsUse.all
  end

  def show
    @environments_use = EnvironmentsUse.find params[:id]
  end

  def new
    @environments_use = EnvironmentsUse.new
  end

  def create
    @environments_use = EnvironmentsUse.new environments_use_params

    if @environments_use.save
      flash[:notice] = 'Uso do Ambiente criado com sucesso!'
      redirect_to environments_uses_path
    else
      render :new
    end
  end

  def edit
    @environments_use = EnvironmentsUse.find params[:id]
  end

  def update
    @environments_use = EnvironmentsUse.find params[:id]

    if @environments_use.update environments_use_params
      flash[:notice] = 'Uso do Ambiente atualizado com sucesso!'
      redirect_to environments_uses_path
    else
      render :edit
    end
  end

  def destroy
    @environments_use = EnvironmentsUse.find params[:id]
    @environments_use.destroy
    flash[:notice] = 'Uso do Ambiente excluído com sucesso!'
    redirect_to environments_uses_path
  end

  private

  def environments_use_params
    params.require(:environments_use).permit :booking_id, :environment_id, :used_at
  end
end
