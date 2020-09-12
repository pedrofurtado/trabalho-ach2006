class MealsUsesController < ApplicationController
  def index
    @meals_uses = MealsUse.all
  end

  def new
    @meals_use = MealsUse.new
  end

  def create
    @meals_use = MealsUse.new meals_uses_params

    if @meals_use.save
      flash[:notice] = "Consumo de Refeição criado com sucesso!"
      redirect_to meals_uses_path
    else
      render :new
    end
  end

  def show
    @meals_use = MealsUse.find params[:id]
  end

  def edit
    @meals_use = MealsUse.find params[:id]
  end

  def update
    @meals_use = MealsUse.find params[:id]

    if @meals_use.update meals_uses_params
      flash[:notice] = 'Consumo de Refeição atualizado com sucesso!'
      redirect_to meals_uses_path
    else
      render :edit
    end
  end

  def destroy
    @meals_use = MealsUse.find params[:id]
    @meals_use.destroy
    flash[:notice] = 'Consumo de Refeição excluído com sucesso!'
    redirect_to meals_uses_path
  end

  private

  def meals_uses_params
    params.require(:meals_use).permit :booking_id, :meal_id, :used_at
  end
end
