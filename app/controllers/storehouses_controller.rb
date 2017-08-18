class StorehousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_storehouse, only: [ :show, :edit, :update, :destroy]

  def index
    if params[:q] == nil
      @storehouses = Storehouse.where.not(latitude: nil, longitude: nil)
    else
      @storehouses = Storehouse.near("#{params[:q]}", 10)
    end
    @hash = Gmaps4rails.build_markers(@storehouses) do |storehouse, marker|
      marker.lat storehouse.latitude
      marker.lng storehouse.longitude
      marker.infowindow render_to_string(partial: "/storehouses/map_box", locals: { storehouse: storehouse })
    end
  end

  def show
     @review = Review.new
     @reservation = Reservation.new
     @hash = Gmaps4rails.build_markers(@storehouse) do |storehouse, marker|
      marker.lat storehouse.latitude
      marker.lng storehouse.longitude
    end
    @reservedDates = get_reserved_dates(@storehouse)
  end

  def new
    @storehouse = Storehouse.new
  end

  def create
    @storehouse = Storehouse.new(params_storehouse)
    @storehouse.user = current_user
    if @storehouse.save
      redirect_to storehouse_path(@storehouse)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @storehouse.update(params_storehouse)
    redirect_to storehouse_path(@storehouse)
  end

  def destroy
    if current_user.id == @storehouse.user_id
      @storehouse.destroy
    end
    redirect_to admin_storehouses_path
  end

  private

  def set_storehouse
    @storehouse = Storehouse.find(params[:id])
  end

  def params_storehouse
    params.require(:storehouse).permit(:name, :address, :capacity, :day_price, :picture, :picture_cache, :description, :user_id, :latitude, :longitude)
  end

  def get_reserved_dates(storehouse)
    @reservedDates = []
    # @reservations = Reservation.where('storehouse_id: ?', storehouse.id)
    storehouse.reservations.each do |resa|
      @reservedDates  = (resa.starts_on..resa.ends_on).map { |date| date.strftime("%d/%m/%Y")}
    end
    return @reservedDates
  end
end
