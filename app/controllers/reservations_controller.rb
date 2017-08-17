class ReservationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_reservation, only: [:destroy, :update]

  def index
    @reservations = Reservation.all
  end

  def show
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
        @reservation.status = "Pending"
        @reservation.storehouse = Storehouse.find(params[:storehouse_id])
    else
      @storehouse = Storehouse.find(params[:id])
      @reservation = Reservation.new
      render "storehouses/show"
    end
    if @reservation.save
      redirect_to admin_reservations_path
    else
      @storehouse = Storehouse.find(params[:id])
      @reservation = Reservation.new
      render "storehouses/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation.destroy
    redirect_to admin_reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def params_reservation
    params.require(:reservation).permit(:starts_on, :ends_on)
  end
end
