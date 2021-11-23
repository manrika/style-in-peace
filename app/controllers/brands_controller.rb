class BrandsController < ApplicationController

  def naughty
  #also create a view - for its own page
    @brand = brand.find(params[:id])
    @newsarticles = NewsArticle.all
  end


end
