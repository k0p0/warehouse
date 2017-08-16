class Admin::StorehousesController < ApplicationController
  def index
    # Let's anticipate on next week (with login)
    @storehouses = Storehouse.where(user_id: current_user)
  end
end
