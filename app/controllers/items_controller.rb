class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @query = params[:query]
      @items = Item.where("title ILIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    # @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save!
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :price, :description, :condition, :delivery,
      :long_rental, :availability, :photo)
  end
end
