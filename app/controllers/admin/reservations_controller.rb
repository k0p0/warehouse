class Admin::ReservationsController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @reservations = Reservation.where(user_id: current_user)
  end
end
