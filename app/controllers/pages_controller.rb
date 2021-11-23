class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_brands = Brand.eco.sort_by(:created_at)
  end
end
