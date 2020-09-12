class CleaningEnvironmentsController < ApplicationController
  def index
    @cleaning_environments = CleaningEnvironment.all
  end

  def show
    @cleaning_environment = CleaningEnvironment.find params[:id]
  end

  def new
    @cleaning_environment = CleaningEnvironment.new
  end

  def create
    @cleaning_environment = CleaningEnvironment.new cleaning_environment_params

    if @cleaning_environment.save
      flash[:notice] = 'Limpeza de Ambiente criado com sucesso!'
      redirect_to cleaning_environments_path
    else
      render :new
    end
  end

  def edit
    @cleaning_environment = CleaningEnvironment.find params[:id]
  end

  def update
    @cleaning_environment = CleaningEnvironment.find params[:id]

    if @cleaning_environment.update cleaning_environment_params
      flash[:notice] = 'Limpeza de Ambiente atualizado com sucesso!'
      redirect_to cleaning_environments_path
    else
      render :edit
    end
  end

  def destroy
    @cleaning_environment = CleaningEnvironment.find params[:id]
    @cleaning_environment.destroy
    flash[:notice] = 'Limpeza de Ambiente excluído com sucesso!'
    redirect_to cleaning_environments_path
  end

  private

  def cleaning_environment_params
    params.require(:cleaning_environment).permit :cleaning_date, :environment_id
  end
end
