class CourtesiesController < ApplicationController
  def index
    @courtesies = Courtesy.all
  end

  def show
    @courtesy = Courtesy.find params[:id]
  end

  def new
    @courtesy = Courtesy.new
  end

  def create
    @courtesy = Courtesy.new courtesy_params

    if @courtesy.save
      flash[:notice] = 'Produto-cortesia criado com sucesso!'
      redirect_to courtesies_path
    else
      render :new
    end
  end

  def edit
    @courtesy = Courtesy.find params[:id]
  end

  def update
    @courtesy = Courtesy.find params[:id]

    if @courtesy.update courtesy_params
      flash[:notice] = 'Produto-cortesia atualizado com sucesso!'
      redirect_to courtesies_path
    else
      render :edit
    end
  end

  def destroy
    @courtesy = Courtesy.find params[:id]
    @courtesy.destroy
    flash[:notice] = 'Produto-cortesia excluído com sucesso!'
    redirect_to courtesies_path
  end

  private

  def courtesy_params
    params.require(:courtesy).permit :name, :description, :price, service_ids: []
  end
end
