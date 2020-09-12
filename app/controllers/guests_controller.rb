class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find params[:id]
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new guest_params

    if @guest.save
      flash[:notice] = 'Hóspede criado com sucesso!'
      redirect_to guests_path
    else
      render :new
    end
  end

  def edit
    @guest = Guest.find params[:id]
  end

  def update
    @guest = Guest.find params[:id]

    if @guest.update guest_params
      flash[:notice] = 'Hóspede atualizado com sucesso!'
      redirect_to guests_path
    else
      render :edit
    end
  end

  def destroy
    @guest = Guest.find params[:id]
    @guest.destroy
    flash[:notice] = 'Hóspede excluído com sucesso!'
    redirect_to guests_path
  end

  private

  def guest_params
    params.require(:guest).permit :name, :phone, :email
  end
end
