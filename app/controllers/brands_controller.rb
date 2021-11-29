class BrandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :naughty ]

  def ecofriendly
    @brand = Brand.find(params[:id])
    # TODO brand photos - cloudinary
    @brands = Brand.eco
    @suggested_brands = @brands.select do |brand|
      brand.price_category == @brand.price_category && brand.style == @brand.style unless brand == @brand
    end
  end

  def naughty
  #also create a view - for its own page
    @brand = Brand.find(params[:id])
    @newsarticles = NewsArticle.all
    @news = @newsarticles.order(created_at: :desc)
    @topnews = @news.first(3)
    @allbrands = Brand.eco
    @suggested_brands = @allbrands.select do |newbrand|
      newbrand.price_category == @brand.price_category && newbrand.style == @brand.style
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
    if params[:query].present?
      @brands = Brand.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @brands = Brand.eco
    end
    @newsarticles = NewsArticle.all
  end

  def local

    if params[:address].present?
      @address = params[:address]
    else
      @address = current_user.address
    end
    @local_brands = Brand.near(@address, 10)
    @eco_local_brands = @local_brands.select do |brand|
      brand.eco? && brand.geocoded?
    end

    @markers = @eco_local_brands.map do |brand|
      {
        lat: brand.latitude,
        lng: brand.longitude,
        info_window: render_to_string(partial: "info_window", locals: { brand: brand }),
      }
    end
  end

  def saved
    @saved_brands = current_user.saved_brands
  end

  def save
    @saved_brand = SavedBrand.new(saved_brand_params)
    if current_user
      @saved_brand.user = current_user
      if @saved_brand.save!
        redirect_to saved_brands_path
        flash[:notice] = 'Brand saved successfully'
      else
        flash[:alert] = 'Brand was not saved.'
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :webiste_url, :insta_url, :price_category, :rating_earth, :rating_people, :rating_animals,:rating_materials, :about, :why_we_love_them, :address, :splash_image, :style)
  end

  def saved_brand_params
    params.require(:brand).permit(:brand_id)
  end
end
