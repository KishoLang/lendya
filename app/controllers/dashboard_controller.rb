class DashboardController < ApplicationController

  def show
    @bookings = Booking.where(user: current_user)
    @booking = params[:booking_id] ? Booking.find(params[:booking_id]) : @bookings.first
  end
end
