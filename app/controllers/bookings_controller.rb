class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :find_booking
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @item = @booking.item
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    if @booking.save
      redirect_to booking_path(@booking)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end


  private

  def booking_params
    params.require(:booking).permit(:item_id)
  end
end
