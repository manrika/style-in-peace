class BrandsController < ApplicationController

  def naughty
  #also create a view - for its own page
    @brand = brand.find(params[:id])
    @news = newsArticle.
  end


end
