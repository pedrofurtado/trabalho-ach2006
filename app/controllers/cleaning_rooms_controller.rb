class CleaningRoomsController < ApplicationController
  def index
    @cleaning_rooms = CleaningRoom.all
  end

  def new
    @cleaning_room = CleaningRoom.new
  end

  def create
    @cleaning_room = CleaningRoom.new cleaning_rooms_params

    if @cleaning_room.save
      flash[:notice] = 'Limpeza de Quarto criado com sucesso!'
      redirect_to cleaning_rooms_path
    else
      render :new
    end
  end

  def show
    @cleaning_room = CleaningRoom.find params[:id]
  end

  def edit
    @cleaning_room = CleaningRoom.find params[:id]
  end

  def update
    @cleaning_room = CleaningRoom.find params[:id]

    if @cleaning_room.update cleaning_rooms_params
      flash[:notice] = 'Limpeza de Quarto atualizado com sucesso!'
      redirect_to cleaning_rooms_path
    else
      render :edit
    end
  end

  def destroy
    @cleaning_room = CleaningRoom.find params[:id]
    @cleaning_room.destroy
    flash[:notice] = 'Limpeza de Quarto excluído com sucesso!'
    redirect_to cleaning_rooms_path
  end

  private

  def cleaning_rooms_params
    params.require(:cleaning_room).permit :cleaning_date, :room_id
  end
end
