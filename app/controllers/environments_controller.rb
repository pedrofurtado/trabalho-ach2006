class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end

  def show
    @environment = Environment.find params[:id]
  end

  def new
    @environment = Environment.new
  end

  def edit
    @environment = Environment.find params[:id]
  end

  def create
    @environment = Environment.new environment_params

    if @environment.save
      flash[:notice] = 'Ambiente criado com sucesso!'
      redirect_to environments_path
    else
      render :new
    end
  end

  def update
    @environment = Environment.find params[:id]

    if @environment.update environment_params
      flash[:notice] = 'Ambiente atualizado com sucesso!'
      redirect_to environments_path
    else
      render :edit
    end
  end

  def destroy
    @environment = Environment.find params[:id]
    @environment.destroy
    flash[:notice] = 'Ambiente excluído com sucesso!'
    redirect_to environments_path
  end

  private

  def environment_params
    params.require(:environment).permit :name, :description, :price
  end
end
