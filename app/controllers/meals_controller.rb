class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find params[:id]
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new meal_params

    if @meal.save
      flash[:notice] = 'Refeição criada com sucesso!'
      redirect_to meals_path
    else
      render :new
    end
  end

  def edit
    @meal = Meal.find params[:id]
  end

  def update
    @meal = Meal.find params[:id]

    if @meal.update meal_params
      flash[:notice] = 'Refeição atualizada com sucesso!'
      redirect_to meals_path
    else
      render :edit
    end
  end

  def destroy
    @meal = Meal.find params[:id]
    @meal.destroy
    flash[:notice] = 'Refeição excluída com sucesso!'
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit :name, :price
  end
end
