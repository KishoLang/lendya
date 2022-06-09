class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path(booking_id: @booking.id)
    else
      render "bookings/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
