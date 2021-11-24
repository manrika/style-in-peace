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

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def explore
    @brands = Brand.eco
    @newsarticles = NewsArticle.all
  end

  def local
    # all brands within 10 miles of user, change number to change distance
    @local_brands = Brand.near(current_user.address, 100)

    @eco_local_brands = @local_brands.select do |brand|
      brand.eco? && brand.geocoded?
    end

    @markers = @eco_local_brands.map do |brand|
      {
        lat: brand.latitude,
        lng: brand.longitude
      }
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :webiste_url, :insta_url, :price_category, :rating_earth, :rating_people, :rating_animals,:rating_materials, :about, :why_we_love_them, :address, :splash_image, :style)
  end

end
