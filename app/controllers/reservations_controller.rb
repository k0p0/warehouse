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
    starts_on = params_reservation[:starts_on].to_date
    ends_on = params_reservation[:ends_on].to_date
    if check_date(starts_on, ends_on)
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
  def check_date(date_start, date_end)
    auj = Date.today.strftime("%m/%d/%Y")
    ((date_start >= auj) && (date_start < date_end)) ? true : false
  end


  def params_reservation
    params.require(:reservation).permit(:starts_on, :ends_on)
  end
end
