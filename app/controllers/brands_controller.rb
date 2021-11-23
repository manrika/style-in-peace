class BrandsController < ApplicationController

  def explore
    @brands = Brand.all
    @newsarticles = NewsArticle.all
  end

end
