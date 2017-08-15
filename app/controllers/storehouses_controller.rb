class StorehousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @storehouses = Storehouse.all
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
    params.require(:storehouse).permit(:name, :address, :capacity, :day_price, :picture, :description, :user_id)
  end
end
