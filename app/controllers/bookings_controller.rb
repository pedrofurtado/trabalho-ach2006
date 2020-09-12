class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new booking_params

    if @booking.save
      flash[:notice] = "Reserva criada com sucesso!"
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find params[:id]
  end

  def edit
    @booking = Booking.find params[:id]
  end

  def update
    @booking = Booking.find params[:id]

    if @booking.update booking_params
      flash[:notice] = 'Reserva atualizada com sucesso!'
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find params[:id]
    @booking.destroy
    flash[:notice] = 'Reserva excluída com sucesso!'
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit :check_in, :check_out, :guest_id, :companions, room_ids: []
  end
end
