class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end

  def show
    # @reservation = Reservation.find(params[:storehouse_id])
    # @reservation = Reservation.new
  end

  def new
    @storehouse = Storehouse.find(params[:id])
    @reservation = Reservation.new
  end


  def create
    @reservation = Reservation.new
    starts_on = Date.strptime(params[:reservation][:starts_on],'%d/%m/%Y')
    ends_on = Date.strptime(params[:reservation][:ends_on],'%d/%m/%Y')
    if ((starts_on >= Date.today) && (starts_on < ends_on))
        @reservation.starts_on = starts_on
        @reservation.ends_on = ends_on
        @reservation.user = current_user
        @reservation.storehouse = Storehouse.find(params[:storehouse_id])
    else
      @storehouse = Storehouse.find(params[:id])
      @reservation = Reservation.new
      render "storehouses/show"
    end
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      @storehouse = Storehouse.find(params[:id])
      @reservation = Reservation.new
      render "storehouses/show"
    end
  end

  def edit
  end

  def update
    # @storehouse.update(params_storehouse)
    # redirect_to storehouse_path(@storehouse)
  end

  def destroy
    @reservation.destroy
    redirect_to storhouses_path
  end

  private

  # def set_storehouse
  #   @storehouse = Storehouse.find(params[:id])
  # end

  def params_reservation
    params.require(:reservation).permit(:starts_on, :ends_on)
  end
end
