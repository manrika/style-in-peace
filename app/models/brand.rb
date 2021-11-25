class Brand < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :saved_brands
  has_many :users, through: :saved_brands
  has_many_attached :photos


  validates :name, presence: true, uniqueness: true
  validates :website_url, presence: true
  validates :price_category, numericality: { only_integer: true }, inclusion: { in: 1..3 }, allow_blank: true
  validates :rating_earth, numericality: { only_integer: true }, inclusion: { in: 1..5 }, allow_blank: true
  validates :rating_people, numericality: { only_integer: true }, inclusion: { in: 1..5 }, allow_blank: true
  validates :rating_animals, numericality: { only_integer: true }, inclusion: { in: 1..5 }, allow_blank: true
  validates :rating_materials, numericality: { only_integer: true }, inclusion: { in: 1..5 }, allow_blank: true
  validates :style, presence: true, inclusion: { in: %w[modern outdoor minimalist retro boujie arty scandinavian grunge
                                                        formal lounge boho] }

  def average_rating
    total_rating = rating_animals.to_f + rating_earth.to_f + rating_materials.to_f + rating_people.to_f
    (total_rating / 4).round
  end

  def self.eco
    brands = Brand.all
    brands.select do |brand|
      brand.average_rating >= 3 && brand.approved == true
    end
  end

  def eco?
    average_rating >= 3
  end
end
