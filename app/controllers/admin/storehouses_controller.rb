class Admin::StorehousesController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @storehouses = Storehouse.where(user_id: current_user)
    tmp = []
    @storehouses.each do |s|
      tmp << s.id
    end
    @reservations = Reservation.where('storehouse_id IN (?)', tmp)
  end
end
