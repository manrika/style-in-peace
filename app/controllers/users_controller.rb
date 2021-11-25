class UsersController < ApplicationController
  def my_impact
    @brands_shared = current_user.brands_shared
    @brands_referred = current_user.brands_referred
    @friends_referred = current_user.friends_referred
    @total_points = @brands_shared.to_i + @brands_referred.to_i + @friends_referred.to_i
  end
end
