class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @new_brands = Brand.eco.sort_by(&:created_at)
    if current_user
      @recommended_brands = Brand.eco.select do |brand|
        brand.price_category == current_user.preference_price && brand.style == current_user.preference_style
      end
    end
  end
end
