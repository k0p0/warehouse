class StorehousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_storehouse, only: [ :show, :edit, :update]

  def index
    @storehouses = Storehouse.all
  end

  def show
     @reservation = Reservation.new
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
    @storehouse.destroy
    redirect_to storhouses_path
  end

  private

  def set_storehouse
    @storehouse = Storehouse.find(params[:id])
  end

  def params_storehouse
    params.require(:storehouse).permit(:name, :address, :capacity, :day_price, :picture, :picture_cache, :description, :user_id)
  end
end
