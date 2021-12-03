class UsersController < ApplicationController
  def my_impact
    if current_user.brands_shared.nil?
      @brands_shared = 0
    else
      @brands_shared = current_user.brands_shared
    end

    if current_user.brands_referred.nil?
      @brands_referred = 0
    else
      @brands_referred = current_user.brands_referred
    end

    if current_user.friends_referred.nil?
      @friends_referred = 0
    else
      @friends_referred = current_user.friends_referred
    end

    @total_points = @brands_shared.to_i + @brands_referred.to_i + @friends_referred.to_i
  end
end
