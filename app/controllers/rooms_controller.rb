class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params

    if @room.save
      flash[:notice] = 'Quarto criado com sucesso!'
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.find params[:id]
    @current_booking = @room.current_booking
  end

  def edit
    @room = Room.find params[:id]
  end

  def update
    @room = Room.find params[:id]

    if @room.update room_params
      flash[:notice] = 'Quarto atualizado com sucesso!'
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find params[:id]
    @room.destroy
    flash[:notice] = 'Quarto excluído com sucesso!'
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit :number, :guest_limit, service_ids: []
  end
end
