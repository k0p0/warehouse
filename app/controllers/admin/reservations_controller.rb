class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:accept, :decline]
  def index
    # Let's anticipate on next week (with login)
    @reservations = Reservation.where(user_id: current_user)
  end

  def accept
    @reservation.status = "Accepted"
    @reservation.save
    redirect_to admin_storehouses_path
  end

  def decline
    @reservation.status = "Declined"
    @reservation.save
    redirect_to admin_storehouses_path
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
