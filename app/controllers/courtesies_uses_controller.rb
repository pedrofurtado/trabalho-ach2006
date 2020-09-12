class CourtesiesUsesController < ApplicationController
  def index
    @courtesies_uses = CourtesiesUse.all
  end

  def show
    @courtesies_use = CourtesiesUse.find params[:id]
  end

  def new
    @courtesies_use = CourtesiesUse.new
  end

  def create
    @courtesies_use = CourtesiesUse.new courtesies_use_params

    if @courtesies_use.save
      flash[:notice] = 'Uso do Produto-Cortesia criado com sucesso!'
      redirect_to courtesies_uses_path
    else
      render :new
    end
  end

  def edit
    @courtesies_use = CourtesiesUse.find params[:id]
  end

  def update
    @courtesies_use = CourtesiesUse.find params[:id]

    if @courtesies_use.update courtesies_use_params
      flash[:notice] = 'Uso do Produto-Cortesia atualizado com sucesso!'
      redirect_to courtesies_uses_path
    else
      render :edit
    end
  end

  def destroy
    @courtesies_use = CourtesiesUse.find params[:id]
    @courtesies_use.destroy
    flash[:notice] = 'Uso do Produto-Cortesia excluído com sucesso!'
    redirect_to courtesies_uses_path
  end

  private

  def courtesies_use_params
    params.require(:courtesies_use).permit :booking_id, :courtesy_id, :used_at
  end
end
