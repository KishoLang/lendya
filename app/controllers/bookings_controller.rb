class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :find_booking
  def index
    @bookings = Booking.all
  end

  def show
    @item = Item.find(params[:item_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.item = Item.find(params[:item_id])
    if @booking.save
      redirect_to item_booking_path(@booking.item, @booking.id)
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:item_id)
  end
end
