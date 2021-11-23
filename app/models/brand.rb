class Brand < ApplicationRecord
  has_many :saved_brands

  validates :name, presence: true, uniqueness: true
  validates :website_url, presence: true
  validates :price_category, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :rating_earth, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :rating_people, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :rating_animals, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :rating_materials, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :about, presence: true, length: { minimum: 100 }
  validates :address, presence: true
  validates :style, inclusion: { in: %w[modern outdoor minimalist retro boujie arty scandinavian grunge formal
                                        lounge boho] }
  validates :approved, presence: true
end
