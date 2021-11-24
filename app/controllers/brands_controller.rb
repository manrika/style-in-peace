class BrandsController < ApplicationController
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
    @brands = Brand.eco
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :webiste_url, :insta_url, :price_category, :rating_earth, :rating_people, :rating_animals,:rating_materials, :about, :why_we_love_them, :address, :splash_image, :style)
  end
end
