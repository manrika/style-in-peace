class Brand < ApplicationRecord
  def self.eco
    Brand.where(average_rating > 2)
  end

  def self.naughty
    Brand.where(average_rating <= 2)
  end
end
