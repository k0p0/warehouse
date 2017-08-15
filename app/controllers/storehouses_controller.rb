class StorehousesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @storehouses = Storehouse.all
    @storehouses = Storehouse.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@storehouses) do |storehouse, marker|
      marker.lat storehouse.latitude
      marker.lng storehouse.longitude
      # marker.infowindow render_to_string(partial: "/storehouses/map_box", locals: { storehouse: storehouse })
    end
  end

  def show
    @storehouse = Storehouse.find(params[:id])
  end

  def new
    @storehouse = Storehouse.new
  end

  def create
    @storehouse = Storehouse.new(params_storehouse)
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
    @storehouse.destroy
    redirect_to storhouses_path
  end

  private

  def set_storhouse
    @storehouse = Storehouse.find(params[:id])
  end

  def params_storehouse
    params.require(:storehouse).permit(:name, :address, :capacity, :day_price, :picture, :description, :user_id, :latitude, :longitude)
  end
end
