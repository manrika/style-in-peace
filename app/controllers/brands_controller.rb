class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :naughty ]

  def naughty
  #also create a view - for its own page
    @brand = Brand.find(params[:id])
    @newsarticles = NewsArticle.all
    @news = @newsarticles.order(created_at: :desc)
    @topnews = @news.first(3)
    @allbrands = Brand.all
    @similarbrands = @allbrands.select do |newbrand|
      newbrand.price_category = @brand.price_category && newbrand.style = @brand.style
    end
    # price and style overlap
  end

end
