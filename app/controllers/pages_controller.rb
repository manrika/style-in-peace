class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @new_brands = Brand.eco.sort_by(&:created_at)
    if current_user
      @recommended_brands = Brand.eco.select do |brand|
        brand.price_category == current_user.preference_price && brand.style == current_user.preference_style
      end
    end

    if params[:query].present?
      @brands = Brand.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @brands = Brand.all.order(:name)
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'pages/list', locals: { brands: @brands }, formats: [:html] }
    end
  end
end
